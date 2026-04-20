{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "depthai_descriptions_v3";
  version = "3.1.1-2";
  src = finalAttrs.passthru.sources."depthai_descriptions_v3";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ robot-state-publisher xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ robot-state-publisher xacro ];
  passthru.sources = mkSourceSet (sources: {
    "depthai_descriptions_v3" = substituteSource {
      src = fetchgit {
        name = "depthai_descriptions_v3-source";
        url = "https://github.com/luxonis/depthai-ros-v3-release.git";
        rev = "bc26383a6dd32a4f025d7b6a70ad4f3502bc661f";
        hash = "sha256-3vxb2WjibmAcWVCQt1Qtl1hPMDudsYjN0XLk5D7QeSs=";
      };
    };
  });
  meta = {
    description = "The depthai_descriptions_v3 package";
  };
})
