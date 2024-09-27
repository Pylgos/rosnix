{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  std_msgs,
  substituteSource,
  trajectory_msgs,
}:
let
  sources = mkSourceSet (sources: {
    "ros2_controllers_test_nodes" = substituteSource {
      src = fetchgit {
        name = "ros2_controllers_test_nodes-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "c493e370dbe7bf168830cb374b97cb9c3f62f92d";
        hash = "sha256-7kWZAbR2GMIR8e8GwVyQ8S6R0C2feakfWkDzgGe9yaQ=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ros2_controllers_test_nodes";
  version = "4.14.0-1";
  src = sources."ros2_controllers_test_nodes";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclpy std_msgs trajectory_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Demo nodes for showing and testing functionalities of the ros2_control framework.";
  };
}
