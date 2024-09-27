{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    visualization_msgs-1e543ac937d80aaffa1e61f7ceff31b5fe61f59d = substituteSource {
      src = fetchgit {
        name = "visualization_msgs-1e543ac937d80aaffa1e61f7ceff31b5fe61f59d-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "1e543ac937d80aaffa1e61f7ceff31b5fe61f59d";
        hash = "sha256-ZlS9JdcYbrNlGsduohJAZQT6DFfNF1DdOYxhQk5xoOw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "visualization_msgs";
  version = "5.4.1-1";
  src = sources.visualization_msgs-1e543ac937d80aaffa1e61f7ceff31b5fe61f59d;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime sensor_msgs std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package containing some visualization and interaction related message definitions.";
  };
}
