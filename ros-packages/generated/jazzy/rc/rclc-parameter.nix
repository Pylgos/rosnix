{
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  osrf-testing-tools-cpp,
  rcl,
  rcl-interfaces,
  rclc,
  rclcpp,
  rcutils,
  rosSystemPackages,
  rosidl-runtime-c,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rclc_parameter";
  version = "6.1.0-3";
  src = finalAttrs.passthru.sources."rclc_parameter";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ builtin-interfaces rcl rcl-interfaces rclc rcutils rosidl-runtime-c ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common example-interfaces osrf-testing-tools-cpp rclcpp std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rclc_parameter" = substituteSource {
      src = fetchgit {
        name = "rclc_parameter-source";
        url = "https://github.com/ros2-gbp/rclc-release.git";
        rev = "75d6c45f9192e3d14b1b982bf9c25d70e42729e5";
        hash = "sha256-A93x6TfzcxJIYgtjzdk6WxPcZgdk96frAyeKMnqXQKQ=";
      };
    };
  });
  meta = {
    description = "Parameter server implementation for micro-ROS nodes";
  };
})
