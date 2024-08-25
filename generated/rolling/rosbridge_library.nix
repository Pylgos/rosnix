{
  actionlib_msgs,
  ament_cmake,
  ament_cmake_pytest,
  ament_cmake_ros,
  buildRosPackage,
  builtin_interfaces,
  diagnostic_msgs,
  example_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav_msgs,
  python3Packages,
  rclpy,
  rosbridge_test_msgs,
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
    rosbridge_library = substituteSource {
      src = fetchgit {
        name = "rosbridge_library-source";
        url = "https://github.com/ros2-gbp/rosbridge_suite-release.git";
        rev = "bd531295b9d1aef7e65db6c72bae7c185d99a66a";
        hash = "sha256-Xk40YYsXUGj/59ea63e2ppoCwrhXp7wDqiWhM84sIR8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbridge_library";
  version = "1.3.2-2";
  src = sources.rosbridge_library;
  nativeBuildInputs = [ ament_cmake ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.pillow python3Packages.pymongo rclpy rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ actionlib_msgs ament_cmake_pytest builtin_interfaces diagnostic_msgs example_interfaces geometry_msgs nav_msgs rosbridge_test_msgs sensor_msgs std_msgs std_srvs stereo_msgs tf2_msgs trajectory_msgs visualization_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "The core rosbridge package, responsible for interpreting JSON andperforming the appropriate ROS action, like subscribe, publish, call service, and interact with params.";
  };
}
