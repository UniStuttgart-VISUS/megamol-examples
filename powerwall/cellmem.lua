pdbFile = "\\\\vestastore\\demos\\megamol-data\\C4.SMD_trajectory.pdb"
xtcFile = "\\\\vestastore\\demos\\megamol-data\\C4.SMD_trajectory.xtc"

mmCreateView("cellmem_demo", "View3DGL", "::cellmem_demo::v")

mmCreateModule("PDBLoader", "::cellmem_demo::pdbdata")
mmSetParamValue("::cellmem_demo::pdbdata::pdbFilename", pdbFile)
mmSetParamValue("::cellmem_demo::pdbdata::xtcFilename", xtcFile)
mmCreateModule("DistantLight", "::cellmem_demo::light")
mmSetParamValue("::cellmem_demo::light::EyeDirection",[=[true]=])

-- molecule
mmCreateModule("SimpleMoleculeRenderer", "::cellmem_demo::molren")
mmCreateCall("MolecularDataCall", "::cellmem_demo::molren::getData", "::cellmem_demo::pdbdata::dataout")
mmCreateCall("CallLight", "::cellmem_demo::molren::getLights", "::cellmem_demo::light::deployLightSlot")

-- cartoon
-- TODO: needs fixes
-- mmCreateModule("MoleculeCartoonRenderer", "::cellmem_demo::cartoonren")
-- mmSetParamValue("::cellmem_demo::cartoonren::renderingMode", "Cartoon Hybrid")
-- mmCreateCall("MolecularDataCall", "::cellmem_demo::cartoonren::getdata", "::cellmem_demo::pdbdata::dataout")

-- volume
-- mmCreateModule("ProteinVolumeRenderer", "::cellmem_demo::volren")
-- mmCreateModule("SimpleMoleculeRenderer", "::cellmem_demo::molren")
-- mmCreateCall("CallRender3DGL", "::cellmem_demo::volren::renderProtein", "::cellmem_demo::molren::rendering")

-- ses
mmCreateModule("MoleculeSESRenderer", "::cellmem_demo::sesren")
mmCreateCall("MolecularDataCall", "::cellmem_demo::sesren::getData", "::cellmem_demo::pdbdata::dataout")
mmCreateCall("CallLight", "::cellmem_demo::sesren::getLights", "::cellmem_demo::light::deployLightSlot")

mmCreateCall("CallRender3DGL", "::cellmem_demo::v::rendering", "::cellmem_demo::molren::rendering")

