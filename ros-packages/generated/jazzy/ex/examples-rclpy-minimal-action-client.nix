{
  action-msgs,
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildRosPackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "examples_rclpy_minimal_action_client" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_action_client-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "3c333603cacbdde270f94bd36697211e18f9e635";
        hash = "sha256-vIQff2y6l1Jq5uMtp2HaEQut9x/n0LaWMp9RrMx5ACE=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "examples_rclpy_minimal_action_client";
  version = "0.19.4-1";
  src = sources."examples_rclpy_minimal_action_client";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ action-msgs example-interfaces rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Examples of minimal action clients using rclpy.";
  };
}
