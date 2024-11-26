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
  version = "6.2.0-1";
  src = finalAttrs.passthru.sources."rclc_parameter";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ builtin-interfaces rcl rcl-interfaces rclc rcutils rosidl-runtime-c ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common example-interfaces osrf-testing-tools-cpp rclcpp std-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rclc_parameter" = substituteSource {
        src = fetchgit {
          name = "rclc_parameter-source";
          url = "https://github.com/ros2-gbp/rclc-release.git";
          rev = "0ff49ddd6218b33dab0139a0c36994038c26ff65";
          hash = "sha256-UDYvrYLk3fIIGr/tjgNWoo/XFXIS0HEJrwtzKHon0mE=";
        };
      };
    });
  };
  meta = {
    description = "Parameter server implementation for micro-ROS nodes";
  };
})
