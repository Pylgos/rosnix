{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
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
    ouster_sensor_msgs-88c8ddb06249e2ea9d794edd07856dfb06d05ebd = substituteSource {
      src = fetchgit {
        name = "ouster_sensor_msgs-88c8ddb06249e2ea9d794edd07856dfb06d05ebd-source";
        url = "https://github.com/ros2-gbp/ouster-ros-release.git";
        rev = "88c8ddb06249e2ea9d794edd07856dfb06d05ebd";
        hash = "sha256-fWka9voPQDtcLHrGdOeYmWY8U9UNQhMwTOlIudhLi28=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ouster_sensor_msgs";
  version = "0.11.1-6";
  src = sources.ouster_sensor_msgs-88c8ddb06249e2ea9d794edd07856dfb06d05ebd;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ouster_ros message and service definitions";
  };
}
