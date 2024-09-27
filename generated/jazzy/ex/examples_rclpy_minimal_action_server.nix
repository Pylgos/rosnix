{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  example_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    examples_rclpy_minimal_action_server-0bfaa358a63b8bc1f7ecfa7f1db366afe7eb7639 = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_action_server-0bfaa358a63b8bc1f7ecfa7f1db366afe7eb7639-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "0bfaa358a63b8bc1f7ecfa7f1db366afe7eb7639";
        hash = "sha256-KYqLXOVHuLvkJFzeJoe7P3ZmBDjckZ6v5358ljw2bt4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclpy_minimal_action_server";
  version = "0.19.4-1";
  src = sources.examples_rclpy_minimal_action_server-0bfaa358a63b8bc1f7ecfa7f1db366afe7eb7639;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ example_interfaces rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Examples of minimal action servers using rclpy.";
  };
}
