{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  ros_environment,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    udp_msgs = substituteSource {
      src = fetchgit {
        name = "udp_msgs-source";
        url = "https://github.com/ros2-gbp/udp_msgs-release.git";
        rev = "2b677f6a0a80cdfccf8e993bf33291735a27a16f";
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
  src = sources.udp_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "ROS / ROS2 udp_msgs package";
  };
}
