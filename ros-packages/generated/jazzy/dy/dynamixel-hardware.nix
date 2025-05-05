{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  dynamixel-workbench-toolbox,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware-interface,
  lifecycle-msgs,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dynamixel_hardware";
  version = "0.5.0-1";
  src = finalAttrs.passthru.sources."dynamixel_hardware";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ dynamixel-workbench-toolbox hardware-interface lifecycle-msgs pluginlib rclcpp rclcpp-lifecycle ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ dynamixel-workbench-toolbox hardware-interface lifecycle-msgs pluginlib rclcpp rclcpp-lifecycle ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "dynamixel_hardware" = substituteSource {
      src = fetchgit {
        name = "dynamixel_hardware-source";
        url = "https://github.com/ros2-gbp/dynamixel_hardware-release.git";
        rev = "9e93cb35756ed7c16e03ad98297796433a909558";
        hash = "sha256-deu91vC3s0Ae1J44bHU0xIFpjV6bJ0q40HfourfwdvQ=";
      };
    };
  });
  meta = {
    description = "ros2_control hardware for ROBOTIS Dynamixel";
  };
})
