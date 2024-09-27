{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  mkSourceSet,
  rmf_dispenser_msgs,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rmf_ingestor_msgs" = substituteSource {
      src = fetchgit {
        name = "rmf_ingestor_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "80cb9499987cbb1651daec50d1e2fbb54ad46793";
        hash = "sha256-ByCTTV+efqO2XsOFUYgcVIJpcOoJGIuJcUh/9o7EkVE=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rmf_ingestor_msgs";
  version = "3.4.0-1";
  src = sources."rmf_ingestor_msgs";
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rmf_dispenser_msgs rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package containing messages used to interface to ingestor workcells";
  };
}
