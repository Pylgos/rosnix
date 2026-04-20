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
  geometry-msgs,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-action,
  rclpy,
  ros-environment,
  rosSystemPackages,
  rosidl-runtime-py,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2,
  tf2-msgs,
  tf2-py,
  tf2-ros,
  tf2-ros-py,
  yasmin,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "yasmin_ros";
  version = "5.0.0-2";
  src = finalAttrs.passthru.sources."yasmin_ros";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ example-interfaces geometry-msgs pluginlib rclcpp rclcpp-action rclpy ros-environment rosidl-runtime-py std-msgs std-srvs tf2 tf2-msgs tf2-py tf2-ros tf2-ros-py yasmin ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ example-interfaces geometry-msgs pluginlib rclcpp rclcpp-action rclpy ros-environment rosidl-runtime-py std-msgs std-srvs tf2 tf2-msgs tf2-py tf2-ros tf2-ros-py yasmin ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest example-interfaces std-msgs tf2 tf2-msgs tf2-py tf2-ros tf2-ros-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-cov" ]; };
  passthru.sources = mkSourceSet (sources: {
    "yasmin_ros" = substituteSource {
      src = fetchgit {
        name = "yasmin_ros-source";
        url = "https://github.com/ros2-gbp/yasmin-release.git";
        rev = "376d0d928b18df61f0f21fd7dd51bfa4346b4b74";
        hash = "sha256-fqqkBUmDbpAOmfhYl3FpIAt7+CToNLm3NeJvZCgGARQ=";
      };
    };
  });
  meta = {
    description = "YASMIN (Yet Another State MachINe) for ROS 2";
  };
})
