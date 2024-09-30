{
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
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
        rev = "6cd4f9aa9c5f72bc49d72fa8159ac31fff78c076";
        hash = "sha256-A93x6TfzcxJIYgtjzdk6WxPcZgdk96frAyeKMnqXQKQ=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rclc_parameter";
  version = "6.1.0-2";
  src = sources."rclc_parameter";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin-interfaces rcl rcl-interfaces rclc rcutils rosidl-runtime-c ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common example-interfaces osrf-testing-tools-cpp rclcpp std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Parameter server implementation for micro-ROS nodes";
  };
}
