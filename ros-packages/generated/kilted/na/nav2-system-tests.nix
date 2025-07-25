{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  launch,
  launch-ros,
  launch-testing,
  mkSourceSet,
  nav-msgs,
  nav2-amcl,
  nav2-behavior-tree,
  nav2-bringup,
  nav2-common,
  nav2-lifecycle-manager,
  nav2-map-server,
  nav2-minimal-tb3-sim,
  nav2-msgs,
  nav2-navfn-planner,
  nav2-planner,
  nav2-util,
  navigation2,
  rclcpp,
  rclcpp-lifecycle,
  rclpy,
  robot-state-publisher,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
  visualization-msgs,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_system_tests";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."nav2_system_tests";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ nav2-common ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ nav2-common ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-index-cpp ament-lint-auto ament-lint-common geometry-msgs launch launch-ros launch-testing nav2-amcl nav2-behavior-tree nav2-bringup nav2-lifecycle-manager nav2-map-server nav2-minimal-tb3-sim nav2-msgs nav2-navfn-planner nav2-planner nav2-util nav-msgs navigation2 rclcpp rclcpp-lifecycle rclpy robot-state-publisher std-msgs tf2 tf2-geometry-msgs tf2-ros visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "lcov" "python3-zmq" ]; };
  passthru.sources = mkSourceSet (sources: {
    "nav2_system_tests" = substituteSource {
      src = fetchgit {
        name = "nav2_system_tests-source";
        url = "https://github.com/ros2-gbp/navigation2-release.git";
        rev = "bb27f68d005a81a6ad3c78888b1cff5962ad50ef";
        hash = "sha256-3eIos61yKHlk3YlMJO68Dz9AVyn9CDwOuqQ4bk37Q1I=";
      };
    };
  });
  meta = {
    description = "A sets of system-level tests for Nav2 usually involving full robot simulation";
  };
})
