{
  ament-cmake,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-common,
  moveit-core,
  moveit-msgs,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2-eigen,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pilz_industrial_motion_planner_testutils";
  version = "2.12.1-1";
  src = finalAttrs.passthru.sources."pilz_industrial_motion_planner_testutils";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module ];
  propagatedBuildInputs = [ moveit-common moveit-core moveit-msgs rclcpp tf2-eigen ];
  passthru.sources = mkSourceSet (sources: {
    "pilz_industrial_motion_planner_testutils" = substituteSource {
      src = fetchgit {
        name = "pilz_industrial_motion_planner_testutils-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "d938ea6e7196df986838f50570b2917e3a051def";
        hash = "sha256-ihEFx60rHsHwyz8atfKozs8SiBCHElqzrMLV+WNP1Wo=";
      };
    };
  });
  meta = {
    description = "Helper scripts and functionality to test industrial motion generation";
  };
})
