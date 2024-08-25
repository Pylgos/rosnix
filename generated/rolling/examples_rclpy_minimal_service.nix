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
        rev = "8778ec7aa4bc99fc99e486af2693d0094070e68d";
        hash = "sha256-m2jpqAYFuKr+37X8FWOBlHx6S+rzYPnwUQdEsfM5Pu8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclpy_minimal_service";
  version = "0.20.2-1";
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
