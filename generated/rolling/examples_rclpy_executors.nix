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
    examples_rclpy_executors = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_executors-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "ee78cf818258989abaa7cf1545d52fe521440d46";
        hash = "sha256-cFc4WOV/BWxKzzC9GXBaUQJ3pYzWxXhU2HEgbdYLcac=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclpy_executors";
  version = "0.20.2-1";
  src = sources.examples_rclpy_executors;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Examples of creating and using exectors to run multiple nodes in the same process";
  };
}
