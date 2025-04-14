{
  ament-cmake,
  ament-cmake-python,
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-action,
  rclpy,
  ros-environment,
  rosSystemPackages,
  substituteSource,
  yasmin,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "yasmin_ros";
  version = "3.2.0-1";
  src = finalAttrs.passthru.sources."yasmin_ros";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ rclcpp rclcpp-action rclpy yasmin ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-cov" ]; };
  passthru.sources = mkSourceSet (sources: {
    "yasmin_ros" = substituteSource {
      src = fetchgit {
        name = "yasmin_ros-source";
        url = "https://github.com/ros2-gbp/yasmin-release.git";
        rev = "53dbb8d6fba61842d437d0b8537ad723808875f0";
        hash = "sha256-4FjksfUFkNwtrLaFihPNvW5845Ya6WJQquyxWyouW7E=";
      };
    };
  });
  meta = {
    description = "YASMIN (Yet Another State MachINe) for ROS 2";
  };
})
