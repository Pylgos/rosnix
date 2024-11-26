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
  version = "6.2.0-1";
  src = finalAttrs.passthru.sources."rclc";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rosidl-generator-c ];
  propagatedBuildInputs = [ rcl rcl-action rcutils rosidl-typesupport-c ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common example-interfaces launch-testing osrf-testing-tools-cpp rclcpp rclcpp-action std-msgs test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rclc" = substituteSource {
      src = fetchgit {
        name = "rclc-source";
        url = "https://github.com/ros2-gbp/rclc-release.git";
        rev = "e7609747d5413ee972c0f9bdf9bb9cb0123851ab";
        hash = "sha256-GGNP6pniXlWU0nCgYg2KuWD2PMNtmXtIWMAOFEBJ8dk=";
      };
    };
  });
  meta = {
    description = "The ROS client library in C.";
  };
})
