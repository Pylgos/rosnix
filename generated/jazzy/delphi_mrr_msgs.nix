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
    delphi_mrr_msgs = substituteSource {
      src = fetchgit {
        name = "delphi_mrr_msgs-source";
        url = "https://github.com/ros2-gbp/astuff_sensor_msgs-release.git";
        rev = "80133cae1505fb482f79e8d2465c8f28d0685ddf";
        hash = "sha256-wRjHKzZNBmMaEJPFEgEysXQ+9dMe3vyzYyFO3V+cuEs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "delphi_mrr_msgs";
  version = "4.0.0-4";
  src = sources.delphi_mrr_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Message definitions for the Delphi MRR";
  };
}
