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
  version = "2.11.0-1";
  src = finalAttrs.passthru.sources."depthai_descriptions";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ robot-state-publisher xacro ];
  passthru.sources = mkSourceSet (sources: {
    "depthai_descriptions" = substituteSource {
      src = fetchgit {
        name = "depthai_descriptions-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "a3a796a59eeb7f1107fcccf5fbeffe84ca9d9bf4";
        hash = "sha256-8FEImn6+NbWea9G3tmOYxDECqsV6ooICgFq1p3NTUBs=";
      };
    };
  });
  meta = {
    description = "The depthai_descriptions package";
  };
})
