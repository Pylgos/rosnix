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
        rev = "9f9d46f6fad31a53c63318737d5ae53dd344aa58";
        hash = "sha256-MGegxz/S1T1QKeNAg7dASD48fl1GCUaPgH6svDm7+VM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "topic_statistics_demo";
  version = "0.33.4-1";
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
