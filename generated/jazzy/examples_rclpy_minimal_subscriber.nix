{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclpy,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    examples_rclpy_minimal_subscriber = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_subscriber-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "7d29ff785559ea11d79ae4e58b24a0d995e96166";
        hash = "sha256-nuGs5Mzwj75ogKk/ZYVbwRHETmQJujeuUm+LaiLV/rc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclpy_minimal_subscriber";
  version = "0.19.4-1";
  src = sources.examples_rclpy_minimal_subscriber;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Examples of minimal subscribers using rclpy.";
  };
}
