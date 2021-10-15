--
-- first declare global variables
--

-- MSMPI env values
mpi_rank_env = "PMI_RANK"
mpi_size_env = "PMI_SIZE"

-- used directly when setting up tiles in local testing scenario
-- and setting mpi broadcaster rank
mpi_rank = mmGetEnvValue(mpi_rank_env)
mpi_size = mmGetEnvValue(mpi_size_env)
-- TODO: check mpi_rank and mpi_size are numbers?
mpi_broadcaster_rank = "0" -- we define the rank that broadcasts
has_mpi = mpi_rank ~= nil

--
-- functions setting up megamol process for specific role
--

function i_am_headnode(control_send_to_address, window) 
    mmSetCliOption("headnode", "on")
    mmSetCliOption("headnode-zmq-target", control_send_to_address)

    mmSetCliOption("window",     window .. "+0+100")
    --mmSetCliOption("guishow",    "on") -- on by default
    --mmSetCliOption("topmost",    "off") -- not needed on desktop or minyou, keshikis set themselves
end

function i_am_rendernode(control_receive_from_address, window, tile) 
    mmSetCliOption("rendernode", "on")
    mmSetCliOption("mpi",        "on")
    mmSetCliOption("mpi-broadcaster-rank", mpi_broadcaster_rank)
    mmSetCliOption("rendernode-zmq-source",  control_receive_from_address)
    mmSetCliOption("tile", tile)

    mmSetCliOption("window",  window)
    mmSetCliOption("guishow", "off")
    --mmSetCliOption("topmost",    "on/off") -- set on for keshiki below, stays off on desktop
end

--
-- local desktop testing
--

control_port = "62562" -- copied from remote plugin
zmq_prefix   = "tcp://"
localhost    = "127.0.0.1"

function to_zmq_address(ip, port)
    return zmq_prefix .. ip .. ":" .. port
end

local_receive_control_from_address = to_zmq_address("*", control_port) -- copied from remote plugin
local_send_control_to_address      = to_zmq_address(localhost, control_port) -- local machine controls renderers on local machine
local_resolution = "1280x720"

function get_local_tile(rank, size, resolution)
    global_width, global_height = string.match(resolution, "(%d+)x(%d+)")
    global_width = tonumber(global_width)
    global_height = tonumber(global_height)
    size = tonumber(size)
    rank = tonumber(rank)

    local_width = global_width // size -- integer division

    local_start_x = rank * local_width
    local_start_y = 0

    local_start = tostring(local_start_x) .. "," .. tostring(local_start_y)

    local_resolution_width = local_width
    if rank+1 == size then
        local_resolution_width = local_width + (global_width - size*local_width)
    end
    local_resolution_height = global_height

    local_resolution = tostring(local_resolution_width) .. "x" .. tostring(local_resolution_height)

    tile = local_start .. ":" .. local_resolution .. ":" .. resolution
    print(tostring(rank) .. " " .. "local tile: " .. tile)

    window_pos_x = local_start_x + 100 + rank*5
    window_pos_y = 100

    window = local_resolution .. "+" .. tostring(window_pos_x) .. "+" .. tostring(window_pos_y)
    return tile, window
end

function run_local ()
    if has_mpi == true then
        local_tile, local_window = get_local_tile(mpi_rank, mpi_size, local_resolution)
        i_am_rendernode(local_receive_control_from_address, local_window, local_tile)
    else
        mmSetCliOption("headnode-broadcast-quit",   "on")
        mmSetCliOption("headnode-broadcast-project","false")
        mmSetCliOption("headnode-connect-at-start", "false")
        i_am_headnode(local_send_control_to_address, local_resolution)
    end
end

--
-- powerwall
--

powerwall_resolution = "10800x4096"
keshiki_resolution   = "1200x4096"
minyou_resolution    = "2592x984"
keshiki01_ip = "10.35.1.1"
minyou_ip    = "10.35.3.1"
powerwall_send_control_commands_to_address      = to_zmq_address(keshiki01_ip, control_port)
powerwall_receive_control_commands_from_address = to_zmq_address(minyou_ip, control_port)
receive_control_from_any_address                = local_receive_control_from_address

function run_minyou () 
    mmSetCliOption("headnode-broadcast-quit",   "off")
    mmSetCliOption("headnode-broadcast-project","off")
    mmSetCliOption("headnode-connect-at-start", "off")
    i_am_headnode(powerwall_send_control_commands_to_address, minyou_resolution)
end

function get_powerwall_tile(keshiki_number)
    -- keshiki_number is already zero based (keshiki01 mapped to 0, and so on ...)
    if keshiki_number == 20 then
        keshiki_number = 6
    end

    -- Ein Projektor rendered 2400x4096, ein Display Knoten rendert 1200x4096
    -- -> zwei Display Knoten pro Projektor.
    -- Die Projektoren überlappen sich aber um ~300px.
    -- D.h. der erste Projektor rendert (0,0) -> (2400,4096) und 
    -- der zweite (2100,0) -> (4200,4096), etc...
    --   Sun Tzu, 2021

    strip = keshiki_number // 4 -- integer division!
    innerStrip = keshiki_number % 2
    xOff = strip * 2100 + innerStrip * 1200
    -- tile = xOff .. ";0;1200;4096" -- from old powerwall config

    keshiki_start_x = xOff
    keshiki_start_y = 0

    keshiki_start = tostring(keshiki_start_x) .. "," .. tostring(keshiki_start_y)

    tile = keshiki_start .. ":" .. keshiki_resolution .. ":" .. powerwall_resolution

    -- TODO: stereo rendering?
    eye = keshiki_number % 4
    if eye < 2 then
        --mmSetConfigValue("tveye", "left")
    else
        --mmSetConfigValue("tveye", "right")
    end

    return tile
end

function run_keshiki (keshiki_number) 
    mmSetCliOption("nodecoration", "on")
    mmSetCliOption("topmost",      "on")
    -- it seems keshikis dont want or like full screen mode?

    keshiki_tile = get_powerwall_tile(keshiki_number)
    keshiki_window = keshiki_resolution .. "+0+0"
    i_am_rendernode(powerwall_receive_control_commands_from_address, keshiki_window, keshiki_tile)
end

--
-- functions end
--

--
-- actual runtime logic
--

print("MegaMol Powerwall Configuration:")

computer = string.lower(mmGetMachineName())

mmSetCliOption("fullscreen",  "off")
mmSetCliOption("vsync",       "on")
mmSetCliOption("interactive", "off")
mmSetCliOption("khrdebug",    "off")

-- if one of powerwall machines, do powerwall things
if computer == "minyou" then
    run_minyou()
else
    if string.find(computer, "keshiki") then
        keshikinumber = string.match(computer, "keshiki(%d+)")
        if keshikinumber ~= nil and has_mpi then
            print("I think I am keshiki" .. keshikinumber)
            run_keshiki(tonumber(keshikinumber)-1) -- map keshiki01 to number 0
        else
            if keshikinumber == nil then
                error("My keshiki has no number?! Computername: " .. computer)
            end
            if not has_mpi then
                error("My keshiki has no MPI?! Computername: " .. computer)
            end
        end
    else
        -- we probably are in a local desktop testing setup
        run_local()
    end
end
