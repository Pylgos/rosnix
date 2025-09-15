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
  version = "30.1.1-1";
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
        rev = "31337df058498d9e3f7703cec91b747a07342ab7";
        hash = "sha256-hkoSZtuAcoyqG67ooBC+dBPEF1Qnmwp+vDiXE/zsb0k=";
      };
    };
  });
  meta = {
    description = "Package containing a prototype for lifecycle implementation";
  };
})
