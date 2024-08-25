{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    velodyne_msgs = substituteSource {
      src = fetchgit {
        name = "velodyne_msgs-source";
        url = "https://github.com/ros2-gbp/velodyne-release.git";
        rev = "3052ae81e5b6f297e86bb46cd6ec6732bd80cde2";
        hash = "sha256-5Ak6A/tW8O/xY1B8LoKlY6GJfvga1cnajGYEKb7eKFo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "velodyne_msgs";
  version = "2.3.0-3";
  src = sources.velodyne_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "ROS message definitions for Velodyne 3D LIDARs.";
  };
}
