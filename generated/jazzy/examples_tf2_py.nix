{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  launch_ros,
  python3Packages,
  rclpy,
  sensor_msgs,
  substituteSource,
  tf2_ros_py,
}:
let
  sources = rec {
    examples_tf2_py = substituteSource {
      src = fetchgit {
        name = "examples_tf2_py-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "684c650fa72d57a815634547d67d85bd5d7cd8c5";
        hash = "sha256-pMk7tDj+6IB2MqJ4DuR77oWQ/ZJG+SL3qQNsviDWwYA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_tf2_py";
  version = "0.36.4-1";
  src = sources.examples_tf2_py;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs launch_ros rclpy sensor_msgs tf2_ros_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Has examples of using the tf2 Python API.";
  };
}
