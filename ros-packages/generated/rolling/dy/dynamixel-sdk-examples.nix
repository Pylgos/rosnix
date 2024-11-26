{
  ament-cmake,
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
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dynamixel_sdk_examples";
  version = "3.7.40-5";
  src = finalAttrs.passthru.sources."dynamixel_sdk_examples";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ dynamixel-sdk dynamixel-sdk-custom-interfaces rclcpp ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "dynamixel_sdk_examples" = substituteSource {
        src = fetchgit {
          name = "dynamixel_sdk_examples-source";
          url = "https://github.com/ros2-gbp/dynamixel_sdk-release.git";
          rev = "3b84d7bfd76d2543317debf39200ec4e65d0051f";
          hash = "sha256-TRPWVWEEJtx/attfpSr6SATpy7YhzqP9x8ef/IVsULA=";
        };
      };
    });
  };
  meta = {
    description = "ROS2 examples using ROBOTIS DYNAMIXEL SDK";
  };
})
