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
  version = "0.6.0-1";
  src = finalAttrs.passthru.sources."dynamixel_hardware";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ dynamixel-workbench-toolbox hardware-interface lifecycle-msgs pluginlib rclcpp rclcpp-lifecycle ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "dynamixel_hardware" = substituteSource {
      src = fetchgit {
        name = "dynamixel_hardware-source";
        url = "https://github.com/ros2-gbp/dynamixel_hardware-release.git";
        rev = "920e17e4d38efca9a8fbc4952b855329b5c7dc90";
        hash = "sha256-CEnfVPi1CXKkJd41iBsJmHPwREpT0tSHXFUPerJIH2Q=";
      };
    };
  });
  meta = {
    description = "ros2_control hardware for ROBOTIS Dynamixel";
  };
})
