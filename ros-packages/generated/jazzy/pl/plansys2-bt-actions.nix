{
  action-msgs,
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  behaviortree-cpp,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  plansys2-executor,
  plansys2-msgs,
  rclcpp,
  rclcpp-action,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
  test-msgs,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plansys2_bt_actions";
  version = "2.0.14-1";
  src = finalAttrs.passthru.sources."plansys2_bt_actions";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ action-msgs behaviortree-cpp plansys2-executor rclcpp rclcpp-action rclcpp-lifecycle ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common geometry-msgs plansys2-msgs test-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "plansys2_bt_actions" = substituteSource {
        src = fetchgit {
          name = "plansys2_bt_actions-source";
          url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
          rev = "286e4f253693ba15eeb3aa97aaa691bdc86ccb0e";
          hash = "sha256-7ifNQ2gxGtePO8kJ5AVkoKyZoqIgtfMpL9nYHMwc+Dc=";
        };
      };
    });
  };
  meta = {
    description = "This package contains the Problem Expert module for the ROS2 Planning System";
  };
})
