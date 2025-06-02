{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  irobot-create-description,
  joint-state-publisher,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
  urdf,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot4_description";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."turtlebot4_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ irobot-create-description joint-state-publisher robot-state-publisher urdf ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ irobot-create-description joint-state-publisher robot-state-publisher urdf ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot4_description" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_description-source";
        url = "https://github.com/ros2-gbp/turtlebot4-release.git";
        rev = "e28dc1cd662c563da168d13ca2ea1c72d532610a";
        hash = "sha256-KKi/T+H7C363W0DGe0Q0ukjAiq+C8aCE6Rcdrwb8jFM=";
      };
    };
  });
  meta = {
    description = "Turtlebot4 Description package";
  };
})
