{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  example_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclpy,
  rosbag2_py,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    rosbag2_examples_py = substituteSource {
      src = fetchgit {
        name = "rosbag2_examples_py-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "7bc14dabff7384a9a56acbd507804b87e8a2bf46";
        hash = "sha256-Xl68NODWGKri/uJZ8Z3Pr6WJNwXBgVQUdPXe7BCDr9w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_examples_py";
  version = "0.29.0-1";
  src = sources.rosbag2_examples_py;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ example_interfaces rclpy rosbag2_py std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Python bag writing tutorial";
  };
}
