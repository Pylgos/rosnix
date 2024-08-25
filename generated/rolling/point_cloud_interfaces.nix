{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    point_cloud_interfaces = substituteSource {
      src = fetchgit {
        name = "point_cloud_interfaces-source";
        url = "https://github.com/ros2-gbp/point_cloud_transport_plugins-release.git";
        rev = "f3a958fd07f5dacd3fd275ed6af84319cf65c7ef";
        hash = "sha256-4ZZGsPF9uuidzhRS8cAC9mKxrkmrqDFvt6doohHNEyI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "point_cloud_interfaces";
  version = "5.0.0-1";
  src = sources.point_cloud_interfaces;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "msg definitions for use with point_cloud_transport plugins.";
  };
}
