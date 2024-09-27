{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_default_generators,
  substituteSource,
}:
let
  sources = rec {
    rclpy_message_converter_msgs-62f2fd348e57474a9695e76a0a5c462b6e6d1357 = substituteSource {
      src = fetchgit {
        name = "rclpy_message_converter_msgs-62f2fd348e57474a9695e76a0a5c462b6e6d1357-source";
        url = "https://github.com/ros2-gbp/rospy_message_converter-release.git";
        rev = "62f2fd348e57474a9695e76a0a5c462b6e6d1357";
        hash = "sha256-p/kxXngXBBgZ4f7MVpWP3clFk+ZLssUxqLlDiRGvh40=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rclpy_message_converter_msgs";
  version = "2.0.2-1";
  src = sources.rclpy_message_converter_msgs-62f2fd348e57474a9695e76a0a5c462b6e6d1357;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Messages for rclpy_message_converter";
  };
}
