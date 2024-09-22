{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
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
    marti_dbw_msgs = substituteSource {
      src = fetchFromGitHub {
        name = "marti_dbw_msgs-source";
        owner = "ros2-gbp";
        repo = "marti_messages-release";
        rev = "395b8d9708b56b76552a69b69d52d0380d171975";
        hash = "sha256-ukl9yb5v2+9dOAAuO4GvYdLnUutr8zuxIqQ5NcpYo1c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "marti_dbw_msgs";
  version = "1.6.1-1";
  src = sources.marti_dbw_msgs;
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
