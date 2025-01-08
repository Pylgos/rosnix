{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-publisher,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
  urdf,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_minimal_tb4_description";
  version = "1.0.2-1";
  src = finalAttrs.passthru.sources."nav2_minimal_tb4_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joint-state-publisher robot-state-publisher urdf xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_minimal_tb4_description" = substituteSource {
      src = fetchgit {
        name = "nav2_minimal_tb4_description-source";
        url = "https://github.com/ros2-gbp/nav2_minimal_turtlebot_simulation-release.git";
        rev = "d755ce764ebbd54cc28a8f3e8d5160e5aef24c74";
        hash = "sha256-pI5T/w7hPCYZwUOFLsai4Wxda6LR6tIvfP8hJLRQ8bY=";
      };
    };
  });
  meta = {
    description = "Nav2's minimum Turtlebot4 Description package";
  };
})
