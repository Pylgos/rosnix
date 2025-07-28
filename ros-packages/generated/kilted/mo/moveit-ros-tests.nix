{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-common,
  moveit-configs-utils,
  moveit-core,
  moveit-planners-chomp,
  moveit-planners-ompl,
  moveit-planners-stomp,
  moveit-resources-panda-moveit-config,
  moveit-ros-move-group,
  moveit-ros-planning,
  moveit-ros-planning-interface,
  moveit-simple-controller-manager,
  pilz-industrial-motion-planner,
  rclcpp,
  ros-testing,
  rosSystemPackages,
  substituteSource,
  tf2-ros,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_ros_tests";
  version = "2.13.2-2";
  src = finalAttrs.passthru.sources."moveit_ros_tests";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ moveit-common rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ moveit-common rclcpp ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto moveit-configs-utils moveit-core moveit-planners-chomp moveit-planners-ompl moveit-planners-stomp moveit-resources-panda-moveit-config moveit-ros-move-group moveit-ros-planning moveit-ros-planning-interface moveit-simple-controller-manager pilz-industrial-motion-planner ros-testing tf2-ros ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_ros_tests" = substituteSource {
      src = fetchgit {
        name = "moveit_ros_tests-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "69f3328bd578567572b091917549e5c65e9f94c8";
        hash = "sha256-RQkpr2dy1iJviff4nsd+ambrL0Wsv3GDVVD4QY6z8GA=";
      };
    };
  });
  meta = {
    description = "Integration tests for moveit_ros";
  };
})
