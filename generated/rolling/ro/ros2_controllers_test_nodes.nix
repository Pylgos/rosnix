{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclpy,
  rosSystemPackages,
  std_msgs,
  substituteSource,
  trajectory_msgs,
}:
let
  sources = rec {
    ros2_controllers_test_nodes-c16cfa9b40295a97a1cdb234aa3e5ee314da645f = substituteSource {
      src = fetchgit {
        name = "ros2_controllers_test_nodes-c16cfa9b40295a97a1cdb234aa3e5ee314da645f-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "c16cfa9b40295a97a1cdb234aa3e5ee314da645f";
        hash = "sha256-7kWZAbR2GMIR8e8GwVyQ8S6R0C2feakfWkDzgGe9yaQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2_controllers_test_nodes";
  version = "4.14.0-1";
  src = sources.ros2_controllers_test_nodes-c16cfa9b40295a97a1cdb234aa3e5ee314da645f;
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
