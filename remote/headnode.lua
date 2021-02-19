role = mmGetConfigValue("role")

print("I am a " .. role)

if role == "head" then

  mmCreateView("headnode", "GUIView", "GUIView1") --confPos={X=279,Y=473}
  mmCreateModule("HeadnodeServer", "::Project_1::HeadnodeServer1") --confPos={X=245,Y=331}

  mmSetParamValue("::Project_1::HeadnodeServer1::port", [=[66566]=])

  mmCreateCall("CallRenderViewGL", "::Project_1::HeadnodeServer1::viewSlot", "::Project_1::View3DGL1::render")
  mmCreateCall("CallRenderViewGL", "::headnode::GUIView1::renderview", "::Project_1::View3DGL1::render")

else

  mmCreateCall("CallRenderViewGL", "::Project_1::RendernodeView1::renderView", "::Project_1::View3DGL1::render")

end


mmCreateModule("TestSpheresDataSource", "::Project_1::TestSpheresDataSource1") --confPos={X=992,Y=409}
mmCreateModule("SphereRenderer", "::Project_1::SphereRenderer1") --confPos={X=681,Y=386}
mmCreateModule("DistantLight", "::Project_1::DistantLight1") --confPos={X=999,Y=199}
mmSetParamValue("::Project_1::DistantLight1::EyeDirection", [=[True]=])
mmCreateModule("View3DGL", "::Project_1::View3DGL1") --confPos={X=439,Y=386}


mmCreateCall("MultiParticleDataCall", "::Project_1::SphereRenderer1::getdata", "::Project_1::TestSpheresDataSource1::getData")
mmCreateCall("CallLight", "::Project_1::SphereRenderer1::lights", "::Project_1::DistantLight1::deployLightSlot")
mmCreateCall("CallRender3DGL", "::Project_1::View3DGL1::rendering", "::Project_1::SphereRenderer1::rendering")

