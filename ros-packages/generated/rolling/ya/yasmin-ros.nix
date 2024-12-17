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
  version = "3.0.2-1";
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
        rev = "49b5316030a884fb199162e8c4fdd66cf942b4c4";
        hash = "sha256-rkLw2flS8nF/FZnlClhb4/NJAU+jH5WhFANhzaiTeC4=";
      };
    };
  });
  meta = {
    description = "YASMIN (Yet Another State MachINe) for ROS 2";
  };
})
