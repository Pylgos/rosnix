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
  version = "1.1.0-2";
  src = finalAttrs.passthru.sources."nav2_minimal_tb4_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ joint-state-publisher robot-state-publisher urdf xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joint-state-publisher robot-state-publisher urdf xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_minimal_tb4_description" = substituteSource {
      src = fetchgit {
        name = "nav2_minimal_tb4_description-source";
        url = "https://github.com/ros2-gbp/nav2_minimal_turtlebot_simulation-release.git";
        rev = "e05bc5517a9fc3665b495e56f30cc552788ad73a";
        hash = "sha256-o+TYnuw3ct/k3c1bbWm15Vr+N7zlg9OOXn2czrfE9VY=";
      };
    };
  });
  meta = {
    description = "Nav2's minimum Turtlebot4 Description package";
  };
})
