pdbFile = "\\\\vestastore\\Demos\\megamol-data\\ccmv_morph_movie_06102010-2.pdb"
xtcFile = "\\\\vestastore\\Demos\\megamol-data\\ccmv_morph_movie_06102010-2.xtc"
  
mmCreateView("mdao_demo", "View3DGL", "v")
  
mmCreateModule("PDBLoader", "::mdao_demo::PDBLoader1")
mmSetParamValue("::mdao_demo::PDBLoader1::pdbFilename", pdbFile)
mmSetParamValue("::mdao_demo::PDBLoader1::xtcFilename", xtcFile)
mmSetParamValue("::mdao_demo::PDBLoader1::strideFlag", "False")
mmCreateModule("AOSphereRenderer", "::mdao_demo::AOSphereRenderer1")
mmSetParamValue("::mdao_demo::AOSphereRenderer1::vol::sizex", "16")
mmSetParamValue("::mdao_demo::AOSphereRenderer1::vol::sizey", "16")
mmSetParamValue("::mdao_demo::AOSphereRenderer1::vol::sizez", "16")
mmSetParamValue("::mdao_demo::AOSphereRenderer1::ao::acc", "1")
mmSetParamValue("::mdao_demo::AOSphereRenderer1::ao::evalFac", "1.5")
mmSetParamValue("::mdao_demo::v::backCol", "black")
mmCreateCall("CallRender3DGL", "::mdao_demo::v::rendering", "::mdao_demo::AOSphereRenderer1::rendering")
mmCreateCall("MolecularDataCall", "::mdao_demo::AOSphereRenderer1::getdata", "::mdao_demo::PDBLoader1::dataout")
