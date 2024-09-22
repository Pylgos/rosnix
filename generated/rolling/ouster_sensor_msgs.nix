{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
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
    ouster_sensor_msgs = substituteSource {
      src = fetchFromGitHub {
        name = "ouster_sensor_msgs-source";
        owner = "ros2-gbp";
        repo = "ouster-ros-release";
        rev = "94d5338c7cae844e9bcf539f6ed45d550331ba35";
        hash = "sha256-fWka9voPQDtcLHrGdOeYmWY8U9UNQhMwTOlIudhLi28=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ouster_sensor_msgs";
  version = "0.11.1-5";
  src = sources.ouster_sensor_msgs;
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
