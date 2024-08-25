{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    pcl_msgs = substituteSource {
      src = fetchgit {
        name = "pcl_msgs-source";
        url = "https://github.com/ros2-gbp/pcl_msgs-release.git";
        rev = "63649a08e304edddf086a71ed8e0c213ec45159d";
        hash = "sha256-YdspDlpwU8CIVBKEa3kLCnDsR3MsuehC9zuvXtAnt4w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pcl_msgs";
  version = "1.0.0-8";
  src = sources.pcl_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Package containing PCL (Point Cloud Library)-related ROS messages.";
  };
}
