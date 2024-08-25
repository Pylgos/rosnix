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
  substituteSource,
}:
let
  sources = rec {
    examples_rclpy_guard_conditions = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_guard_conditions-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "ceb9c6b951751c2968be3a982a683eb5901de400";
        hash = "sha256-LctTVumwKoUpo5HAKlZ2YWQYguLozzRM8R1tK74/bVY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclpy_guard_conditions";
  version = "0.20.2-1";
  src = sources.examples_rclpy_guard_conditions;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Examples of using guard conditions.";
  };
}
