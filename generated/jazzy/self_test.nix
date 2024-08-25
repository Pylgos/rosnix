{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  diagnostic_msgs,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    self_test = substituteSource {
      src = fetchgit {
        name = "self_test-source";
        url = "https://github.com/ros2-gbp/diagnostics-release.git";
        rev = "7c06341055f2de2b1e15f547c4aec55aec612c46";
        hash = "sha256-XqNh45xEkk9YHfdL2dag+8htUkqi+DeC1snyIDTYBp8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "self_test";
  version = "4.2.1-1";
  src = sources.self_test;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ diagnostic_msgs diagnostic_updater rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "self_test";
  };
}
