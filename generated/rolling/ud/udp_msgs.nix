{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  ros_environment,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    udp_msgs-cff9e3e887938db4f1281b153e65fd108fd8a4d9 = substituteSource {
      src = fetchgit {
        name = "udp_msgs-cff9e3e887938db4f1281b153e65fd108fd8a4d9-source";
        url = "https://github.com/ros2-gbp/udp_msgs-release.git";
        rev = "cff9e3e887938db4f1281b153e65fd108fd8a4d9";
        hash = "sha256-wk0E8P+RhBD3LVdBSrcJHrF2CwKgOXysrKAiCDRiSPI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "udp_msgs";
  version = "0.0.5-1";
  src = sources.udp_msgs-cff9e3e887938db4f1281b153e65fd108fd8a4d9;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS / ROS2 udp_msgs package";
  };
}
