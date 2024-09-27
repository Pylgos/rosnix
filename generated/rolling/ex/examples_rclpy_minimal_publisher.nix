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
    examples_rclpy_minimal_publisher-fff20d168e2568a020fe516e5c7c69f9b8190fc5 = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_publisher-fff20d168e2568a020fe516e5c7c69f9b8190fc5-source";
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
  src = sources.examples_rclpy_minimal_publisher-fff20d168e2568a020fe516e5c7c69f9b8190fc5;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclpy std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Examples of minimal publishers using rclpy.";
  };
}
