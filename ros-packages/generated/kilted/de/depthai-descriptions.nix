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
  pname = "depthai_descriptions";
  version = "3.2.0-1";
  src = finalAttrs.passthru.sources."depthai_descriptions";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ robot-state-publisher xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ robot-state-publisher xacro ];
  passthru.sources = mkSourceSet (sources: {
    "depthai_descriptions" = substituteSource {
      src = fetchgit {
        name = "depthai_descriptions-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "ed99dabfcccb721fd7eafecbf264b6a17cecfb84";
        hash = "sha256-NJN1IA6qFef7pkRkkwg2BNEpvPnZguGYpdeKTpcnjpc=";
      };
    };
  });
  meta = {
    description = "The depthai_descriptions package";
  };
})
