{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    flir_camera_msgs = substituteSource {
      src = fetchgit {
        name = "flir_camera_msgs-source";
        url = "https://github.com/ros2-gbp/flir_camera_driver-release.git";
        rev = "716e1850eae27dcd28e9ee98a2b5149e23f20353";
        hash = "sha256-jlKxZPXxL4UTWrIgsk4bOYU9oeyoW9deS08ci3Uh2GI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "flir_camera_msgs";
  version = "2.0.20-1";
  src = sources.flir_camera_msgs;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "messages related to flir camera driver";
  };
}
