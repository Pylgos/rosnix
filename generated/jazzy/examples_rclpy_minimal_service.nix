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
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    examples_rclpy_minimal_service = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_service-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "974f22c135ba13dab49c95d5268e06ecd6d46805";
        hash = "sha256-jrpXqNzN9kxaRAjcxrJQvNyjOtifMEcr+3dqMovB9zY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclpy_minimal_service";
  version = "0.19.4-1";
  src = sources.examples_rclpy_minimal_service;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ example_interfaces rclpy std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Examples of minimal service servers using rclpy.";
  };
}
