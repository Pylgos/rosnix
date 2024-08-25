{
  ament_cmake,
  buildRosPackage,
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
    gps_msgs = substituteSource {
      src = fetchgit {
        name = "gps_msgs-source";
        url = "https://github.com/ros2-gbp/gps_umd-release.git";
        rev = "f572d023b466c3b5960fd5629951424b5344b677";
        hash = "sha256-1RkI1XM2+N+2B6AXCDVx6WfEhwXaU/PIHvKOB0B9q1Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gps_msgs";
  version = "2.0.3-2";
  src = sources.gps_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "GPS messages for use in GPS drivers";
  };
}
