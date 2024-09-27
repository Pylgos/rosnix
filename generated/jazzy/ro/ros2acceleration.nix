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
    ros2acceleration-18eede7c818416a07f43314c8a39b6c7abc5b03e = substituteSource {
      src = fetchgit {
        name = "ros2acceleration-18eede7c818416a07f43314c8a39b6c7abc5b03e-source";
        url = "https://github.com/ros2-gbp/ros2acceleration-release.git";
        rev = "18eede7c818416a07f43314c8a39b6c7abc5b03e";
        hash = "sha256-DRkaUv6JAKKbX1+DqnpK8wTDm1+jlEoHal/0i6rhA6I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2acceleration";
  version = "0.5.1-4";
  src = sources.ros2acceleration-18eede7c818416a07f43314c8a39b6c7abc5b03e;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" "python3-yaml" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclpy ros2cli rosidl_runtime_py ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_xmllint test_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "The acceleration command for ROS 2 command line tools.";
  };
}
