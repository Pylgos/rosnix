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
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    rmf_obstacle_msgs-a796af42f093c36eab792b59b423a4d1f98c57f0 = substituteSource {
      src = fetchgit {
        name = "rmf_obstacle_msgs-a796af42f093c36eab792b59b423a4d1f98c57f0-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "a796af42f093c36eab792b59b423a4d1f98c57f0";
        hash = "sha256-mxfaFAH5p/S3vxK4RdkH6kRiLSEWAyw4UfSCuD8DwBI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_obstacle_msgs";
  version = "3.3.1-1";
  src = sources.rmf_obstacle_msgs-a796af42f093c36eab792b59b423a4d1f98c57f0;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package containing messages for describing obstacles in the environment";
  };
}
