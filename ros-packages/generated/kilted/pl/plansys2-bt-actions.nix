{
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
  lifecycle-msgs,
  mkSourceSet,
  plansys2-executor,
  plansys2-msgs,
  rclcpp,
  rclcpp-action,
  rclcpp-lifecycle,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  test-msgs,
  tf2-geometry-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plansys2_bt_actions";
  version = "3.0.2-1";
  src = finalAttrs.passthru.sources."plansys2_bt_actions";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ behaviortree-cpp lifecycle-msgs plansys2-executor rclcpp rclcpp-action rclcpp-lifecycle std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ behaviortree-cpp lifecycle-msgs plansys2-executor rclcpp rclcpp-action rclcpp-lifecycle std-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common geometry-msgs plansys2-msgs test-msgs tf2-geometry-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2_bt_actions" = substituteSource {
      src = fetchgit {
        name = "plansys2_bt_actions-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "c2fbafbbd87137cee28e2207701f6cfb1e32b8fb";
        hash = "sha256-ZyhiOBlVJknbUhOT9GLxe8aFk9zd2gTdF37Brt/4mqk=";
      };
    };
  });
  meta = {
    description = "This package contains the Problem Expert module for the ROS2 Planning System";
  };
})
