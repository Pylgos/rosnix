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
  version = "3.8.4-1";
  src = finalAttrs.passthru.sources."dynamixel_sdk_examples";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ dynamixel-sdk dynamixel-sdk-custom-interfaces rclcpp rclpy ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ dynamixel-sdk dynamixel-sdk-custom-interfaces rclcpp rclpy ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "dynamixel_sdk_examples" = substituteSource {
      src = fetchgit {
        name = "dynamixel_sdk_examples-source";
        url = "https://github.com/ros2-gbp/dynamixel_sdk-release.git";
        rev = "b9f3d72ac406072eb83a0e9754ab96a4e2cb5714";
        hash = "sha256-MmDeQn8ugjJ20H2Pd1xd35td/pwG+CyG8XCjruiVxEU=";
      };
    };
  });
  meta = {
    description = "ROS 2 examples using ROBOTIS DYNAMIXEL SDK";
  };
})
