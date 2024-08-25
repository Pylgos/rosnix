{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    ouster_sensor_msgs = substituteSource {
      src = fetchgit {
        name = "ouster_sensor_msgs-source";
        url = "https://github.com/ros2-gbp/ouster-ros-release.git";
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
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "ouster_ros message and service definitions";
  };
}
