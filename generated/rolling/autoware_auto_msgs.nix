{
  action_msgs,
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    autoware_auto_msgs = substituteSource {
      src = fetchgit {
        name = "autoware_auto_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_auto_msgs-release.git";
        rev = "b7d7292d4d73d6fc0ab5406086104f9a5012b267";
        hash = "sha256-sPwNe2uGjV3WHz+htqZrzm5dUO1JvGJC9xQcn2d+LU0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "autoware_auto_msgs";
  version = "1.0.0-6";
  src = sources.autoware_auto_msgs;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs geometry_msgs rosidl_default_runtime sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Interfaces between core Autoware.Auto components";
  };
}
