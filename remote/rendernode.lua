mmCreateView("rendernode", "GUIView", "GUIView1") --confPos={X=276,Y=371}
mmCreateModule("RendernodeView", "::Project_1::RendernodeView1") --confPos={X=530,Y=370}
mmSetParamValue("::Project_1::RendernodeView1::BCastRank", [=[0]=])
mmCreateModule("MpiProvider", "::Project_1::MpiProvider1") --confPos={X=816,Y=384}
mmCreateCall("CallRenderViewGL", "::rendernode::GUIView1::renderview", "::Project_1::RendernodeView1::render")
mmCreateCall("MpiCall", "::Project_1::RendernodeView1::requestMPI", "::Project_1::MpiProvider1::provideMpi")
