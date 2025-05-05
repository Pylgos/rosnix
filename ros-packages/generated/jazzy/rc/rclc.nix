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
  version = "6.1.0-3";
  src = finalAttrs.passthru.sources."rclc";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rcl rcl-action rosidl-generator-c ];
  propagatedBuildInputs = [ rcutils rosidl-typesupport-c ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common example-interfaces launch-testing osrf-testing-tools-cpp rclcpp rclcpp-action std-msgs test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rclc" = substituteSource {
      src = fetchgit {
        name = "rclc-source";
        url = "https://github.com/ros2-gbp/rclc-release.git";
        rev = "b34236539056dee4ec3a309c0c3a4c8db6ebd383";
        hash = "sha256-A49/yUw6gCxZpDhW8qijU7K6AFuP1R5dzLhqDvefndA=";
      };
    };
  });
  meta = {
    description = "The ROS client library in C.";
  };
})
