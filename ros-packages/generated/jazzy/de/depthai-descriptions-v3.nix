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
  version = "3.2.0-1";
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
        rev = "89c6c9a63c81ecc17aee97f277548b73f28ac196";
        hash = "sha256-EZM1T1FUSmRHCm2Qjky4HHqLQ04x9JB/4dkbhB82wso=";
      };
    };
  });
  meta = {
    description = "The depthai_descriptions_v3 package";
  };
})
