{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rcutils,
  sensor_msgs,
  statistics_msgs,
  substituteSource,
}:
let
  sources = rec {
    topic_statistics_demo = substituteSource {
      src = fetchgit {
        name = "topic_statistics_demo-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "e1907df448636e5dd94ff2d850c0113c94daa4df";
        hash = "sha256-OlO5t7+iAoMYbqErFwVmm6hLKUhUroA88+QHpxjBuPE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "topic_statistics_demo";
  version = "0.33.5-1";
  src = sources.topic_statistics_demo;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rcutils sensor_msgs statistics_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "C++ demo application for topic statistics feature.";
  };
}
