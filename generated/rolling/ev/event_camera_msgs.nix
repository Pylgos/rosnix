{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  ros_environment,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    event_camera_msgs-3b6c787c53375507d0c470b3b9d06ab4785d444e = substituteSource {
      src = fetchgit {
        name = "event_camera_msgs-3b6c787c53375507d0c470b3b9d06ab4785d444e-source";
        url = "https://github.com/ros2-gbp/event_camera_msgs-release.git";
        rev = "3b6c787c53375507d0c470b3b9d06ab4785d444e";
        hash = "sha256-eSVTxQf3iPYpb2cQQHGiBixNwRVKCsDQ9qfGRKzk6vI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "event_camera_msgs";
  version = "1.0.6-1";
  src = sources.event_camera_msgs-3b6c787c53375507d0c470b3b9d06ab4785d444e;
  nativeBuildInputs = [ ament_cmake ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "messages for event based cameras";
  };
}
