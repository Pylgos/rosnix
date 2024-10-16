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
let
  sources = mkSourceSet (sources: {
    "rclc_parameter" = substituteSource {
      src = fetchgit {
        name = "rclc_parameter-source";
        url = "https://github.com/ros2-gbp/rclc-release.git";
        rev = "0ff49ddd6218b33dab0139a0c36994038c26ff65";
        hash = "sha256-UDYvrYLk3fIIGr/tjgNWoo/XFXIS0HEJrwtzKHon0mE=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "rclc_parameter";
  version = "6.2.0-1";
  src = finalAttrs.passthru.sources."rclc_parameter";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin-interfaces rcl rcl-interfaces rclc rcutils rosidl-runtime-c ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common example-interfaces osrf-testing-tools-cpp rclcpp std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Parameter server implementation for micro-ROS nodes";
  };
})
