{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_mypy,
  ament_pep257,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclpy,
  ros2cli,
  ros_testing,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    sros2 = substituteSource {
      src = fetchgit {
        name = "sros2-source";
        url = "https://github.com/ros2-gbp/sros2-release.git";
        rev = "49754a3069a8259c21c74f7727630590ba10c9d6";
        hash = "sha256-iJpmSqylzgKZx7KePA6YOgLeKtGvAMFaDWHzyL0YVlc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sros2";
  version = "0.15.1-1";
  src = sources.sros2;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.argcomplete buildPackages.python3Packages.importlib-resources ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python python3Packages.cryptography python3Packages.lxml rclpy ros2cli ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_mypy ament_pep257 python3Packages.pytest ros_testing test_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "Command line tools for managing SROS2 keys";
  };
}
