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
  rcl_interfaces,
  rclpy,
  ros2cli,
  ros2node,
  ros2service,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ros2param-a98c2a5c83e1364660a625aef68dff1979c534b2 = substituteSource {
      src = fetchgit {
        name = "ros2param-a98c2a5c83e1364660a625aef68dff1979c534b2-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "a98c2a5c83e1364660a625aef68dff1979c534b2";
        hash = "sha256-zOQUR6gwAev32UdMK+efB6uZKzTyJ2811oI6Jcag6Zk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2param";
  version = "0.34.1-1";
  src = sources.ros2param-a98c2a5c83e1364660a625aef68dff1979c534b2;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rcl_interfaces rclpy ros2cli ros2node ros2service ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_xmllint launch launch_ros launch_testing launch_testing_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  meta = {
    description = "The param command for ROS 2 command line tools.";
  };
}
