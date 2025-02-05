{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  controller-manager,
  crane-plus-description,
  crane-plus-moveit-config,
  fetchgit,
  fetchurl,
  fetchzip,
  gripper-controllers,
  mkSourceSet,
  robot-state-publisher,
  ros-gz,
  ros2-controllers,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "crane_plus_gazebo";
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."crane_plus_gazebo";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ controller-manager crane-plus-description crane-plus-moveit-config gripper-controllers robot-state-publisher ros2-controllers ros-gz ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "crane_plus_gazebo" = substituteSource {
      src = fetchgit {
        name = "crane_plus_gazebo-source";
        url = "https://github.com/ros2-gbp/crane_plus-release.git";
        rev = "ccce12c5b37d3aacd342eb4d3b981f50d865f661";
        hash = "sha256-htWjSJjfEwRXlbPckB1YLD86PBdK4mZEbD+073GQpKc=";
      };
    };
  });
  meta = {
    description = "CRANE+ V2 gazebo simulation package";
  };
})
