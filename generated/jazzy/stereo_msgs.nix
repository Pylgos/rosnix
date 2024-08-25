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
    stereo_msgs = substituteSource {
      src = fetchgit {
        name = "stereo_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "ac381a89e37baac54f65169fb5eadfb197b5788f";
        hash = "sha256-pslCBNIHA/ok2N2kdjY3FQeLs6/snomzRWKXWnE/iTc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "stereo_msgs";
  version = "5.3.5-1";
  src = sources.stereo_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "A package containing some stereo camera related message definitions.";
  };
}
