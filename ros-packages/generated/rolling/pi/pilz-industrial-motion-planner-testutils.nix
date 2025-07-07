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
  version = "2.14.0-1";
  src = finalAttrs.passthru.sources."pilz_industrial_motion_planner_testutils";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module moveit-common moveit-core moveit-msgs rclcpp tf2-eigen ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ eigen3-cmake-module moveit-common moveit-core moveit-msgs rclcpp tf2-eigen ];
  passthru.sources = mkSourceSet (sources: {
    "pilz_industrial_motion_planner_testutils" = substituteSource {
      src = fetchgit {
        name = "pilz_industrial_motion_planner_testutils-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "f3103f9c063db8b1ea21cc84d98b8de1594c37d3";
        hash = "sha256-VRbRGTysEJzpGd3Wg9CF5C0fhFRn4KiHTv3VjWBg5vg=";
      };
    };
  });
  meta = {
    description = "Helper scripts and functionality to test industrial motion generation";
  };
})
