{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mimick-vendor,
  mkSourceSet,
  performance-test-fixture,
  rcl,
  rcl-interfaces,
  rcl-lifecycle,
  rclcpp,
  rcpputils,
  rcutils,
  rmw,
  rosSystemPackages,
  rosidl-typesupport-cpp,
  substituteSource,
  test-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rclcpp_lifecycle";
  version = "29.5.3-1";
  src = finalAttrs.passthru.sources."rclcpp_lifecycle";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ lifecycle-msgs rcl rcl-interfaces rcl-lifecycle rclcpp rcutils rmw rosidl-typesupport-cpp ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ lifecycle-msgs rcl rcl-interfaces rcl-lifecycle rclcpp rcutils rmw rosidl-typesupport-cpp ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common mimick-vendor performance-test-fixture rcpputils test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rclcpp_lifecycle" = substituteSource {
      src = fetchgit {
        name = "rclcpp_lifecycle-source";
        url = "https://github.com/ros2-gbp/rclcpp-release.git";
        rev = "225f1357eb143ec5cac8a6c2c027f5fa6673672d";
        hash = "sha256-9nxrxLhOT8P4L+j+KB0zcpNvLKq4S9ywtYNGWRIdPR4=";
      };
    };
  });
  meta = {
    description = "Package containing a prototype for lifecycle implementation";
  };
})
