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
  version = "30.0.0-1";
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
        rev = "7bbcbc1571809afcedd5170785988cb057124ce1";
        hash = "sha256-lAFOiruZs5hSpm6q5ob9z/ZeHoiiM/OFXvZ9cpEdrKM=";
      };
    };
  });
  meta = {
    description = "Package containing a prototype for lifecycle implementation";
  };
})
