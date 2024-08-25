{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rc_common_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  shape_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    rc_reason_msgs = substituteSource {
      src = fetchgit {
        name = "rc_reason_msgs-source";
        url = "https://github.com/ros2-gbp/rc_reason_clients-release.git";
        rev = "61412342ea7654265445a3887c083719e768c3fd";
        hash = "sha256-4UWrVAe/idz19Rp3JIISd3dreXqEZKnY2FgbPcNPfqQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rc_reason_msgs";
  version = "0.3.1-2";
  src = sources.rc_reason_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rc_common_msgs rosidl_default_runtime shape_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Msg and srv definitions for rc_reason_clients";
  };
}
