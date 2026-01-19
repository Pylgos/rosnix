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
  version = "4.2.3-1";
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
        rev = "56e7b4c9cdb1b59236124433ea2a335c4ccc9ae8";
        hash = "sha256-dqz9eQ6M6OorTkG43Cme0+gqDU9zyYuRV0UD0zjVTTk=";
      };
    };
  });
  meta = {
    description = "YASMIN (Yet Another State MachINe) for ROS 2";
  };
})
