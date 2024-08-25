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
    examples_rclpy_minimal_client = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_client-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "9c2c893b334bf2bfeeee9537bc5be53761722ac4";
        hash = "sha256-NVYYU7S41hAgYD78ChWOKfhWxfkM1beqQhx5gJQtZao=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclpy_minimal_client";
  version = "0.20.2-1";
  src = sources.examples_rclpy_minimal_client;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ example_interfaces rclpy std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Examples of minimal service clients using rclpy.";
  };
}
