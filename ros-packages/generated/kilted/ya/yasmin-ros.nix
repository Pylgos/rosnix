{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-python,
  buildAmentCmakePackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-action,
  rclpy,
  ros-environment,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  yasmin,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "yasmin_ros";
  version = "4.2.4-1";
  src = finalAttrs.passthru.sources."yasmin_ros";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-action rclpy ros-environment yasmin ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ rclcpp rclcpp-action rclpy ros-environment yasmin ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest example-interfaces std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-cov" ]; };
  passthru.sources = mkSourceSet (sources: {
    "yasmin_ros" = substituteSource {
      src = fetchgit {
        name = "yasmin_ros-source";
        url = "https://github.com/ros2-gbp/yasmin-release.git";
        rev = "9e2d9a0a721dde6362d2e272687bbc082f4c2756";
        hash = "sha256-QHJpUFw2Lrrnv9j0u/ObBewYHYRI2/zS56UzNi/5dbg=";
      };
    };
  });
  meta = {
    description = "YASMIN (Yet Another State MachINe) for ROS 2";
  };
})
