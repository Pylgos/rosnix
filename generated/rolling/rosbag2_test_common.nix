{
  ament_cmake,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python_cmake_module,
  rclcpp,
  rcutils,
  substituteSource,
}:
let
  sources = rec {
    rosbag2_test_common = substituteSource {
      src = fetchgit {
        name = "rosbag2_test_common-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "650a2a079c4fc8ad965a5c6598dedafc2be952b1";
        hash = "sha256-xPMq/umOMQGvSGLlB67qvQxfqmFAE54QFGxCWuqDvPs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_test_common";
  version = "0.28.0-1";
  src = sources.rosbag2_test_common;
  nativeBuildInputs = [ ament_cmake ament_cmake_python python_cmake_module ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rcutils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Commonly used test helper classes and fixtures for rosbag2";
  };
}
