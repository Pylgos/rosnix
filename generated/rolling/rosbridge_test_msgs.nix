{
  actionlib_msgs,
  ament_cmake,
  ament_cmake_pytest,
  buildRosPackage,
  builtin_interfaces,
  diagnostic_msgs,
  example_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav_msgs,
  rclpy,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  std_srvs,
  stereo_msgs,
  substituteSource,
  tf2_msgs,
  trajectory_msgs,
  visualization_msgs,
}:
let
  sources = rec {
    rosbridge_test_msgs = substituteSource {
      src = fetchgit {
        name = "rosbridge_test_msgs-source";
        url = "https://github.com/ros2-gbp/rosbridge_suite-release.git";
        rev = "fd996cb68650164c34169addc8fb596dc279b917";
        hash = "sha256-ZgToC3Qm971d8Pn8MxepqwV+Qby1hi//qfK1idwJSIc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbridge_test_msgs";
  version = "1.3.2-2";
  src = sources.rosbridge_test_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rclpy rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ actionlib_msgs ament_cmake_pytest builtin_interfaces diagnostic_msgs example_interfaces geometry_msgs nav_msgs sensor_msgs std_msgs std_srvs stereo_msgs tf2_msgs trajectory_msgs visualization_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "Message and service definitions used in internal tests for rosbridge packages.";
  };
}
