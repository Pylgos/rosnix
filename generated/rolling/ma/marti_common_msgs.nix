{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
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
    marti_common_msgs-f1cdbcbd211ef0a98106d5f0cd0e347bfe7721af = substituteSource {
      src = fetchgit {
        name = "marti_common_msgs-f1cdbcbd211ef0a98106d5f0cd0e347bfe7721af-source";
        url = "https://github.com/ros2-gbp/marti_messages-release.git";
        rev = "f1cdbcbd211ef0a98106d5f0cd0e347bfe7721af";
        hash = "sha256-N4Z+x0Qn74ATmU9Bo/KkNEKCi0vdy+RNRuBNCeP7eWE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "marti_common_msgs";
  version = "1.6.1-1";
  src = sources.marti_common_msgs-f1cdbcbd211ef0a98106d5f0cd0e347bfe7721af;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "marti_common_msgs";
  };
}
