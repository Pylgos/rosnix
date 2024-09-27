{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    rmf_lift_msgs-7bde0e3a44aa28f48a200305762f4dbb81636c08 = substituteSource {
      src = fetchgit {
        name = "rmf_lift_msgs-7bde0e3a44aa28f48a200305762f4dbb81636c08-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "7bde0e3a44aa28f48a200305762f4dbb81636c08";
        hash = "sha256-nOEHLKOFOfoESrFoDSQcXcBWu20rgvI33o0DoeC9IE4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_lift_msgs";
  version = "3.3.1-1";
  src = sources.rmf_lift_msgs-7bde0e3a44aa28f48a200305762f4dbb81636c08;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Messages used to interface to lifts.";
  };
}
