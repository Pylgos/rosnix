{
  action_msgs,
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_core_runtime,
  service_msgs,
  substituteSource,
}:
let
  sources = rec {
    rosidl_default_runtime = substituteSource {
      src = fetchgit {
        name = "rosidl_default_runtime-source";
        url = "https://github.com/ros2-gbp/rosidl_defaults-release.git";
        rev = "7326804d446ce5351ebec700d02fce00af208ef0";
        hash = "sha256-RMOLLNeW7tpo4RtB1vJ3OV29gTjs+8Uvxyeyg/RPhjc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_default_runtime";
  version = "1.7.1-1";
  src = sources.rosidl_default_runtime;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ action_msgs rosidl_core_runtime service_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A configuration package defining the runtime for the ROS interfaces.";
  };
}
