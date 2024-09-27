{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  launch_testing,
  launch_testing_ros,
  rclpy,
  ros2cli,
  rosSystemPackages,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    ros2node-f0e9aa2108c225140121d80f3679e87569156d59 = substituteSource {
      src = fetchgit {
        name = "ros2node-f0e9aa2108c225140121d80f3679e87569156d59-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "f0e9aa2108c225140121d80f3679e87569156d59";
        hash = "sha256-Qe5QPGSUYtkg1l2R8V0oen9m8BP97iXaZqvdB3rn5Zs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2node";
  version = "0.34.1-1";
  src = sources.ros2node-f0e9aa2108c225140121d80f3679e87569156d59;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclpy ros2cli ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_xmllint launch launch_ros launch_testing launch_testing_ros rclpy test_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  meta = {
    description = "The node command for ROS 2 command line tools.";
  };
}
