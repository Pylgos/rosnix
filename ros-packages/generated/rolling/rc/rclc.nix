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
  version = "6.2.1-1";
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
        rev = "226002f2295e08839e9937c7206a731555f16243";
        hash = "sha256-JCCW0OJpkXVVgOzZTeg3+W8hH+ssz9M/3kjKuw/oFvM=";
      };
    };
  });
  meta = {
    description = "The ROS client library in C.";
  };
})
