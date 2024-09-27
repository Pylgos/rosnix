{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclpy,
  ros2cli,
  rosSystemPackages,
  rosidl_runtime_py,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    ros2acceleration-68bb4a8cac40d09d0935915f94804cd724705761 = substituteSource {
      src = fetchgit {
        name = "ros2acceleration-68bb4a8cac40d09d0935915f94804cd724705761-source";
        url = "https://github.com/ros2-gbp/ros2acceleration-release.git";
        rev = "68bb4a8cac40d09d0935915f94804cd724705761";
        hash = "sha256-DRkaUv6JAKKbX1+DqnpK8wTDm1+jlEoHal/0i6rhA6I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2acceleration";
  version = "0.5.1-3";
  src = sources.ros2acceleration-68bb4a8cac40d09d0935915f94804cd724705761;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclpy ros2cli rosidl_runtime_py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_xmllint test_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "The acceleration command for ROS 2 command line tools.";
  };
}
