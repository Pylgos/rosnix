{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
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
    delphi_srr_msgs = substituteSource {
      src = fetchgit {
        name = "delphi_srr_msgs-source";
        url = "https://github.com/ros2-gbp/astuff_sensor_msgs-release.git";
        rev = "6e40e9d1e06ca2ddf0633edcebafc7fe4f580f59";
        hash = "sha256-Vu/trELYAZeFsNU7L9/L1c/gwv48ZdARSjJ1HkujJaU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "delphi_srr_msgs";
  version = "4.0.0-3";
  src = sources.delphi_srr_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Message definitions for the Delphi SRR";
  };
}
