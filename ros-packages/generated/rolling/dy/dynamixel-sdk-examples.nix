{
  ament-cmake,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  dynamixel-sdk,
  dynamixel-sdk-custom-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dynamixel_sdk_examples";
  version = "3.8.2-1";
  src = finalAttrs.passthru.sources."dynamixel_sdk_examples";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ dynamixel-sdk dynamixel-sdk-custom-interfaces rclcpp rclpy ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "dynamixel_sdk_examples" = substituteSource {
      src = fetchgit {
        name = "dynamixel_sdk_examples-source";
        url = "https://github.com/ros2-gbp/dynamixel_sdk-release.git";
        rev = "799c7eabd7af72082ef8847d785d1dd298e372b2";
        hash = "sha256-7u5h2SgEPWIlbJFsCVQdTfg5CAzn0tWTR8RBT8IwUYY=";
      };
    };
  });
  meta = {
    description = "ROS 2 examples using ROBOTIS DYNAMIXEL SDK";
  };
})
