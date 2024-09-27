{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "marti_dbw_msgs" = substituteSource {
      src = fetchgit {
        name = "marti_dbw_msgs-source";
        url = "https://github.com/ros2-gbp/marti_messages-release.git";
        rev = "9fca883b54f60007150a800910a0be1211ea18fb";
        hash = "sha256-ukl9yb5v2+9dOAAuO4GvYdLnUutr8zuxIqQ5NcpYo1c=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "marti_dbw_msgs";
  version = "1.6.1-1";
  src = sources."marti_dbw_msgs";
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "marti_dbw_msgs";
  };
}
