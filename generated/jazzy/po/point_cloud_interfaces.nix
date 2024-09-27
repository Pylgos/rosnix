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
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    point_cloud_interfaces-2e11c14a317c118f45be6734e866cdcaedaceb6e = substituteSource {
      src = fetchgit {
        name = "point_cloud_interfaces-2e11c14a317c118f45be6734e866cdcaedaceb6e-source";
        url = "https://github.com/ros2-gbp/point_cloud_transport_plugins-release.git";
        rev = "2e11c14a317c118f45be6734e866cdcaedaceb6e";
        hash = "sha256-1Ymq8mMTxypnyf4FmU8KvHqTwQkNy7Ofv+NdxOajqxU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "point_cloud_interfaces";
  version = "4.0.1-1";
  src = sources.point_cloud_interfaces-2e11c14a317c118f45be6734e866cdcaedaceb6e;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime sensor_msgs std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "msg definitions for use with point_cloud_transport plugins.";
  };
}
