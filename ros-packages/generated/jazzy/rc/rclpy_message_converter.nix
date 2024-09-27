{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclpy,
  rclpy_message_converter_msgs,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_parser,
  rosidl_runtime_py,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2_msgs,
}:
let
  sources = rec {
    rclpy_message_converter-5e7b6eadffc924bce02c147aaee115e21b564fc8 = substituteSource {
      src = fetchgit {
        name = "rclpy_message_converter-5e7b6eadffc924bce02c147aaee115e21b564fc8-source";
        url = "https://github.com/ros2-gbp/rospy_message_converter-release.git";
        rev = "5e7b6eadffc924bce02c147aaee115e21b564fc8";
        hash = "sha256-4HeOI1VnkkBwlxa0SlJMAGbmV5bMUIvxslRecDwZm04=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rclpy_message_converter";
  version = "2.0.1-4";
  src = sources.rclpy_message_converter-5e7b6eadffc924bce02c147aaee115e21b564fc8;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators rosidl_parser ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rclpy rosidl_runtime_py ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 geometry_msgs rclpy_message_converter_msgs std_msgs std_srvs tf2_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Converts between Python dictionaries and JSON to rclpy messages.";
  };
}
