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
  version = "3.0.5-1";
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
        rev = "bb75f624dfcd1338527376a602e845b9f3de65c5";
        hash = "sha256-asVXWj8GoJ+xemDjAHBXXfAqn3g+3sgFCs/W83EJlwE=";
      };
    };
  });
  meta = {
    description = "The depthai_descriptions package";
  };
})
