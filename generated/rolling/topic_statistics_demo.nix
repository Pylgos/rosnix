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
        rev = "185fcd09de2c7e3da2d77d862ae8efab9b710a6c";
        hash = "sha256-7oiuiwErcM8hKhjegdW3hF6j2FkAejchawKZ+EE2U6w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "topic_statistics_demo";
  version = "0.34.2-1";
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
