{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  angles,
  buildAmentCmakePackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware-interface,
  joint-state-broadcaster,
  joint-trajectory-controller,
  launch,
  launch-ros,
  launch-testing,
  mkSourceSet,
  picknik-ament-copyright,
  rclcpp,
  rclpy,
  robot-state-publisher,
  ros-testing,
  ros2-control-test-assets,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "topic_based_ros2_control";
  version = "0.3.0-4";
  src = finalAttrs.passthru.sources."topic_based_ros2_control";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ angles hardware-interface rclcpp sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles hardware-interface rclcpp sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common controller-manager joint-state-broadcaster joint-trajectory-controller launch launch-ros launch-testing picknik-ament-copyright rclpy robot-state-publisher ros2-control-test-assets ros-testing xacro ];
  passthru.sources = mkSourceSet (sources: {
    "topic_based_ros2_control" = substituteSource {
      src = fetchgit {
        name = "topic_based_ros2_control-source";
        url = "https://github.com/ros2-gbp/topic_based_ros2_control-release.git";
        rev = "0e9c68a91bbc3a233609b80186e2f9dd47b0c700";
        hash = "sha256-/LXAeYIUM6zz2f4AAR/O60Dur1rR76xdno0Kz8qMqB0=";
      };
    };
  });
  meta = {
    description = "ros2 control hardware interface for topic_based sim";
  };
})
