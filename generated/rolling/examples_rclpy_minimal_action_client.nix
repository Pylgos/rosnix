{
  action_msgs,
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
  substituteSource,
}:
let
  sources = rec {
    examples_rclpy_minimal_action_client = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_action_client-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "b4d95326ec92b9e11dafb6109eabd60f6988a908";
        hash = "sha256-8SF2H3h+DWhLR3tR5o96ZnWLvan7OgMd3YG3FTj01LU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclpy_minimal_action_client";
  version = "0.20.2-1";
  src = sources.examples_rclpy_minimal_action_client;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs example_interfaces rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Examples of minimal action clients using rclpy.";
  };
}
