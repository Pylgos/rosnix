{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_ros,
  launch_testing,
  python3Packages,
  rclpy,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    launch_testing_ros = substituteSource {
      src = fetchgit {
        name = "launch_testing_ros-source";
        url = "https://github.com/ros2-gbp/launch_ros-release.git";
        rev = "8e943047d58bff614e8f7dd35c0c809bf58a1f12";
        hash = "sha256-EaW2/JmgZXRjYiG0YFcWQA2jQNQVAnPudqOLe3J7/kA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_testing_ros";
  version = "0.26.5-2";
  src = sources.launch_testing_ros;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python launch_ros launch_testing rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest std_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "A package providing utilities for writing ROS2 enabled launch tests.";
  };
}
