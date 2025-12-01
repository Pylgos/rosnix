{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-copyright,
  ament-flake8,
  ament-pep257,
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
  version = "4.0.1-1";
  src = finalAttrs.passthru.sources."yasmin_ros";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-action rclpy ros-environment yasmin ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ rclcpp rclcpp-action rclpy ros-environment yasmin ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-copyright ament-flake8 ament-pep257 example-interfaces std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-cov" ]; };
  passthru.sources = mkSourceSet (sources: {
    "yasmin_ros" = substituteSource {
      src = fetchgit {
        name = "yasmin_ros-source";
        url = "https://github.com/ros2-gbp/yasmin-release.git";
        rev = "96ab72a840010aa658711b6f83852fb211295792";
        hash = "sha256-ruyJm+FcZdpSqSebkLsNp/AC/Lduuu9Q8mFmle4Y+WI=";
      };
    };
  });
  meta = {
    description = "YASMIN (Yet Another State MachINe) for ROS 2";
  };
})
