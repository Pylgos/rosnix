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
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    examples_rclpy_executors-ee78cf818258989abaa7cf1545d52fe521440d46 = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_executors-ee78cf818258989abaa7cf1545d52fe521440d46-source";
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
  src = sources.examples_rclpy_executors-ee78cf818258989abaa7cf1545d52fe521440d46;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclpy std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Examples of creating and using exectors to run multiple nodes in the same process";
  };
}
