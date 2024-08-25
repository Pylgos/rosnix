{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle_msgs,
  osrf_testing_tools_cpp,
  rcl_lifecycle,
  rclc,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    rclc_lifecycle = substituteSource {
      src = fetchgit {
        name = "rclc_lifecycle-source";
        url = "https://github.com/ros2-gbp/rclc-release.git";
        rev = "63cb85126fa62f19193ad312fb39b8f15ab223c1";
        hash = "sha256-S6rPft/BC8XXLe0C9UCT8oPlYVqM0Vvvoj1MqVoApNQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rclc_lifecycle";
  version = "6.1.0-3";
  src = sources.rclc_lifecycle;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lifecycle_msgs rcl_lifecycle rclc std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common osrf_testing_tools_cpp ];
  missingDependencies = [  ];
  meta = {
    description = "rclc lifecycle convenience methods.";
  };
}
