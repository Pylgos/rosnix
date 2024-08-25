{
  ament_cmake_ros,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    rosbridge_msgs = substituteSource {
      src = fetchgit {
        name = "rosbridge_msgs-source";
        url = "https://github.com/ros2-gbp/rosbridge_suite-release.git";
        rev = "4abc4e5de80f7e4dcb16bc59483edc78756191f6";
        hash = "sha256-gef94q+tOtKcYirePzrQpnNRqyw/TxlebG49vn/OYXI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbridge_msgs";
  version = "1.3.2-3";
  src = sources.rosbridge_msgs;
  nativeBuildInputs = [ ament_cmake_ros rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Package containing message files";
  };
}
