{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    examples_rclpy_guard_conditions-ceb9c6b951751c2968be3a982a683eb5901de400 = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_guard_conditions-ceb9c6b951751c2968be3a982a683eb5901de400-source";
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
  src = sources.examples_rclpy_guard_conditions-ceb9c6b951751c2968be3a982a683eb5901de400;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Examples of using guard conditions.";
  };
}
