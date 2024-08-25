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
    examples_rclpy_minimal_publisher = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_publisher-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "fff20d168e2568a020fe516e5c7c69f9b8190fc5";
        hash = "sha256-6/jdqtssg27v92BzFjsdH6SaE34Acu78BbuiSpVTAhM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclpy_minimal_publisher";
  version = "0.20.2-1";
  src = sources.examples_rclpy_minimal_publisher;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Examples of minimal publishers using rclpy.";
  };
}
