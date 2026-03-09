{
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-testing,
  mkSourceSet,
  osrf-testing-tools-cpp,
  rcl,
  rcl-action,
  rclcpp,
  rclcpp-action,
  rcutils,
  rosSystemPackages,
  rosidl-generator-c,
  rosidl-typesupport-c,
  std-msgs,
  substituteSource,
  test-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rclc";
  version = "6.1.2-1";
  src = finalAttrs.passthru.sources."rclc";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rcl rcl-action rcutils rosidl-generator-c rosidl-typesupport-c ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ rcl rcl-action rcutils rosidl-generator-c rosidl-typesupport-c ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common example-interfaces launch-testing osrf-testing-tools-cpp rclcpp rclcpp-action std-msgs test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rclc" = substituteSource {
      src = fetchgit {
        name = "rclc-source";
        url = "https://github.com/ros2-gbp/rclc-release.git";
        rev = "eab946b7ca4ad6faab6cf0f69842210c8cf9dad3";
        hash = "sha256-A162K9U2Gi/e7jSF79bK54FAwrgVGaFVxN1MXkJrRtg=";
      };
    };
  });
  meta = {
    description = "The ROS client library in C.";
  };
})
