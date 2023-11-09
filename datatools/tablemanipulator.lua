mmCheckVersion("24fa3d98d6c3cd6d-dirty")
mmCreateView("GraphEntry_1","SplitViewGL","::SplitViewGL_1")

mmCreateModule("SplitViewGL","::SplitViewGL_2")
mmCreateModule("View2DGL","::View2DGL_1")
mmCreateModule("View2DGL","::View2DGL_2")
mmCreateModule("View2DGL","::View2DGL_3")
mmCreateModule("ScatterplotMatrixRenderer2D","::ScatterplotMatrixRenderer2D_1")
mmCreateModule("ParallelCoordinatesRenderer2D","::ParallelCoordinatesRenderer2D_1")
mmCreateModule("TableHistogramRenderer2D","::TableHistogramRenderer2D_1")
mmCreateModule("CSVDataSource","::CSVDataSource_1")
mmCreateModule("TransferFunctionGL","::TransferFunction_1")
mmCreateModule("UniFlagStorageGL","::UniFlagStorageGL_1")
mmCreateModule("TableManipulator","::TableManipulator_1")

mmCreateCall("CallRenderViewGL","::SplitViewGL_1::render1","::View2DGL_1::render")
mmCreateCall("CallRenderViewGL","::SplitViewGL_1::render2","::SplitViewGL_2::render")
mmCreateCall("CallRenderViewGL","::SplitViewGL_2::render1","::View2DGL_2::render")
mmCreateCall("CallRenderViewGL","::SplitViewGL_2::render2","::View2DGL_3::render")
mmCreateCall("CallRender2DGL","::View2DGL_1::rendering","::ScatterplotMatrixRenderer2D_1::rendering")
mmCreateCall("CallRender2DGL","::View2DGL_2::rendering","::ParallelCoordinatesRenderer2D_1::rendering")
mmCreateCall("CallRender2DGL","::View2DGL_3::rendering","::TableHistogramRenderer2D_1::rendering")
mmCreateCall("TableDataCall","::ScatterplotMatrixRenderer2D_1::ftIn","::CSVDataSource_1::getData")
mmCreateCall("CallGetTransferFunctionGL","::ScatterplotMatrixRenderer2D_1::tfIn","::TransferFunction_1::gettransferfunction")
mmCreateCall("FlagCallRead_GL","::ScatterplotMatrixRenderer2D_1::readFlags","::UniFlagStorageGL_1::readFlags")
mmCreateCall("FlagCallWrite_GL","::ScatterplotMatrixRenderer2D_1::writeFlags","::UniFlagStorageGL_1::writeFlags")
mmCreateCall("TableDataCall","::ParallelCoordinatesRenderer2D_1::getData","::TableManipulator_1::dataOut")
mmCreateCall("CallGetTransferFunctionGL","::ParallelCoordinatesRenderer2D_1::getTransferFunction","::TransferFunction_1::gettransferfunction")
mmCreateCall("FlagCallRead_GL","::ParallelCoordinatesRenderer2D_1::readFlagStorage","::UniFlagStorageGL_1::readFlags")
mmCreateCall("FlagCallWrite_GL","::ParallelCoordinatesRenderer2D_1::writeFlagStorage","::UniFlagStorageGL_1::writeFlags")
mmCreateCall("CallGetTransferFunctionGL","::TableHistogramRenderer2D_1::getTransferFunction","::TransferFunction_1::gettransferfunction")
mmCreateCall("TableDataCall","::TableHistogramRenderer2D_1::getData","::CSVDataSource_1::getData")
mmCreateCall("FlagCallRead_GL","::TableHistogramRenderer2D_1::readFlagStorage","::UniFlagStorageGL_1::readFlags")
mmCreateCall("FlagCallWrite_GL","::TableHistogramRenderer2D_1::writeFlagStorage","::UniFlagStorageGL_1::writeFlags")
mmCreateCall("TableDataCall","::TableManipulator_1::dataIn","::CSVDataSource_1::getData")

mmSetParamValue("::SplitViewGL_2::split.orientation",[=[Vertical]=])
mmSetParamValue("::CSVDataSource_1::filename",[=[../examples/sampledata/iris.csv]=])
mmSetParamValue("::CSVDataSource_1::colSep",[=[,]=])
mmSetParamValue("::CSVDataSource_1::decSep",[=[US (3.141)]=])
mmSetParamValue("::UniFlagStorageGL_1::serializedFlags",[=[{"enabled":[[0,149]],"filtered":[],"selected":[]}]=])
mmSetParamValue("::TableManipulator_1::script",[=[-- example script copying everything from right to left
rows, cols = mmGetInputSize()
print('got data of size ' .. tostring(rows) .. ' x ' .. tostring(cols))

newcols = cols + 2

-- always set number of output columns first!
mmSetOutputColumns(newcols)

mins = {}
maxes = {}

for c = 0, cols - 1 do
    n = mmGetInputColumnName(c)
    min, max = mmGetInputColumnRange(c)
    print('col ' .. tostring(c) .. '(' .. n .. '): [' .. tostring(min) .. ';' .. tostring(max) .. ']')
    -- copy original names
    mmSetOutputColumnName(c, n)
    -- copy original ranges
    mmSetOutputColumnRange(c, min, max)
    mins[c] = math.huge
    maxes[c] = -math.huge
end

for c = cols, newcols - 1 do
    mins[c] = math.huge
    maxes[c] = -math.huge
end
mmSetOutputColumnName(cols, "sepal_area")
mmSetOutputColumnName(cols + 1, "petal_area")

-- this allocates the complete table at once for best performance
-- you need to do this row-wise if you want to filter out data 
mmAddOutputRows(rows)

for r = 0, rows -1 do
    -- alternative to above: mmAddOutputRows(1), is slower because of re-allocations
    for c = 0, cols - 1 do
        v = mmGetCellValue(r, c)
        if v < mins[c] then
            mins[c] = v
        end
        if v > maxes[c] then
            maxes[c] = v
        end
        mmSetCellValue(r, c, v)
    end

    for n = 0, newcols-cols-1 do
        v1 = mmGetCellValue(r, 0 + 2 * n)
        v2 = mmGetCellValue(r, 1 + 2 * n)
        area = v1 * v2
        the_c = cols + n
        if area < mins[the_c] then
            mins[the_c] = area
        end
        if area > maxes[the_c] then
            maxes[the_c] = area
        end
        mmSetCellValue(r, cols + n, area)
    end
end


print('setting new ranges:')
for c = 0, newcols - 1 do
    print('col ' .. tostring(c) .. ': [' .. tostring(mins[c]) .. ';' .. tostring(maxes[c]) .. ']')
    mmSetOutputColumnRange(c, mins[c], maxes[c])
end
]=])

