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
  version = "6.3.0-1";
  src = finalAttrs.passthru.sources."rclc_parameter";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ builtin-interfaces rcl rcl-interfaces rclc rcutils rosidl-runtime-c ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ builtin-interfaces rcl rcl-interfaces rclc rcutils rosidl-runtime-c ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common example-interfaces osrf-testing-tools-cpp rclcpp std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rclc_parameter" = substituteSource {
      src = fetchgit {
        name = "rclc_parameter-source";
        url = "https://github.com/ros2-gbp/rclc-release.git";
        rev = "90253819ba920ebdf6b1bd6466b8e12c7c3b095a";
        hash = "sha256-tVho7NWWzaDEQtxbW6stfuisRXy82d4Luk+z26i0Mfs=";
      };
    };
  });
  meta = {
    description = "Parameter server implementation for micro-ROS nodes";
  };
})
