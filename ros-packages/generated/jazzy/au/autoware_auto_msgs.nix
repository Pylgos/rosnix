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
  mkSourceSet,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "autoware_auto_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_auto_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_auto_msgs-release.git";
        rev = "f0718df1847edd2e93373607df31b52a675a0f31";
        hash = "sha256-sPwNe2uGjV3WHz+htqZrzm5dUO1JvGJC9xQcn2d+LU0=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "autoware_auto_msgs";
  version = "1.0.0-7";
  src = sources."autoware_auto_msgs";
  nativeBuildInputs = [ ament_cmake_auto ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ action_msgs geometry_msgs rosidl_default_runtime sensor_msgs std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Interfaces between core Autoware.Auto components";
  };
}
