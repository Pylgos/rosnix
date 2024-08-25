{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
  vision_msgs,
}:
let
  sources = rec {
    webots_ros2_msgs = substituteSource {
      src = fetchgit {
        name = "webots_ros2_msgs-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "2da9e20d9c002bf9bcba1ab7bf78c5244a9c55d1";
        hash = "sha256-JqQw9sZlQ+FC3E6cjgt+uIWAOIo71p5qQUTns/ppNZ8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "webots_ros2_msgs";
  version = "2023.1.3-1";
  src = sources.webots_ros2_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs vision_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Services and Messages of the webots_ros2 packages.";
  };
}
