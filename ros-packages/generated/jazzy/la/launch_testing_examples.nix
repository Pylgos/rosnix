{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  demo_nodes_cpp,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  launch_testing,
  launch_testing_ros,
  mkSourceSet,
  rcl_interfaces,
  rclpy,
  ros2bag,
  rosSystemPackages,
  std_msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "launch_testing_examples" = substituteSource {
      src = fetchgit {
        name = "launch_testing_examples-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "c2236ee11ef8f07bccd6904e0db1d6579fd030d4";
        hash = "sha256-AnGtfmc/Fo5R0zEcot5yB6C+xgFOA31yvAnV9fQRBK0=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "launch_testing_examples";
  version = "0.19.4-1";
  src = sources."launch_testing_examples";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pytest" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ demo_nodes_cpp launch launch_ros launch_testing launch_testing_ros rcl_interfaces rclpy ros2bag std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Examples of simple launch tests";
  };
}
