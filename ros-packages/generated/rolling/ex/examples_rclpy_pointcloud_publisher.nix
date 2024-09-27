{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  sensor_msgs,
  sensor_msgs_py,
  std_msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "examples_rclpy_pointcloud_publisher" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_pointcloud_publisher-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "7cd335317211a164d296178dad487d918551d8a6";
        hash = "sha256-kT9gvbRxKAgA3IOP9sMZsS2QsOpmLil9G5Pv8mKteQw=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "examples_rclpy_pointcloud_publisher";
  version = "0.20.2-1";
  src = sources."examples_rclpy_pointcloud_publisher";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclpy sensor_msgs sensor_msgs_py std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Example on how to publish a Pointcloud2 message";
  };
}
