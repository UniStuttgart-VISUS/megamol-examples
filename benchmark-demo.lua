-- MegaMol
-- Copyright (c) 2023, MegaMol Dev Team
-- All rights reserved.
--
-- == Benchmark Demo ==
--

-- Project init
mmCreateView("GraphEntry_1","View2DGL","::View2DGL_1")

mmCreateModule("ParallelCoordinatesRenderer2D","::ParallelCoordinatesRenderer2D_1")
mmCreateModule("CSVDataSource","::CSVDataSource_1")
mmCreateModule("TransferFunctionGL","::TransferFunction_1")
mmCreateModule("UniFlagStorageGL","::UniFlagStorageGL_1")

mmCreateCall("CallRender2DGL","::View2DGL_1::rendering","::ParallelCoordinatesRenderer2D_1::rendering")
mmCreateCall("TableDataCall","::ParallelCoordinatesRenderer2D_1::getData","::CSVDataSource_1::getData")
mmCreateCall("CallGetTransferFunctionGL","::ParallelCoordinatesRenderer2D_1::getTransferFunction","::TransferFunction_1::gettransferfunction")
mmCreateCall("FlagCallRead_GL","::ParallelCoordinatesRenderer2D_1::readFlagStorage","::UniFlagStorageGL_1::readFlags")
mmCreateCall("FlagCallWrite_GL","::ParallelCoordinatesRenderer2D_1::writeFlagStorage","::UniFlagStorageGL_1::writeFlags")

mmSetParamValue("::CSVDataSource_1::filename",[=[../examples/sampledata/iris.csv]=])
mmSetParamValue("::CSVDataSource_1::colSep",[=[,]=])
mmSetParamValue("::CSVDataSource_1::decSep",[=[US (3.141)]=])

-- Additional config
mmSetGUIVisible(false)

-- Define benchmark parameter space
resolutions = {480, 720, 1080, 1440, 2160}
trianglemodes = {"true", "false"}

-- Loop over resolution parameter
for _, r in ipairs(resolutions) do

  -- Set resolution to view framebuffer and window
  width = math.ceil(r * 16 / 9)
  mmSetViewFramebufferSize("::View2DGL_1", width, r)
  mmSetWindowFramebufferSize(width, r)
  mmRenderNextFrame() -- Always render a dummy frame to apply changes

  -- View reset to center screen after resolution change
  mmSetParamValue("::View2DGL_1::view::resetView", [=[true]=])
  mmRenderNextFrame()

  -- Loop over different line modes of the PCP renderer
  for _, tm in ipairs(trianglemodes) do
    mmSetParamValue("::ParallelCoordinatesRenderer2D_1::triangleMode", tm)
    mmRenderNextFrame()

    -- create a unique filename for the current parameter set
    testname = "Test_res-" .. string.format("%04d", r) .. "_" .. "triangles-" .. tm

    -- Optionally store a screenshot of the view (or window)
    --mmScreenshotEntryPoint( "::View2DGL_1", testname .. ".png")
    --mmScreenshot(testname .. ".png")

    -- Render a few dummy frames as warmup
    for i = 1, 10 do
      mmRenderNextFrame()
    end

    -- Run bechmark and store frametimes
    times = {}
    for i = 1, 100 do
      mmRenderNextFrame()
      t = mmLastFrameTime()
      table.insert(times, t)
    end

    -- Write frame times to csv file
    csv = ""
    for _, t in ipairs(times) do
      csv = csv .. t .. "\n"
    end
    mmWriteTextFile(testname .. ".csv", csv)

  end
end

-- Quit
mmQuit()
