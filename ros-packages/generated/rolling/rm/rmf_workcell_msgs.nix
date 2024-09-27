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
    rmf_workcell_msgs-14ab76a1d4b734908c0d8c91e39acf4417ab6006 = substituteSource {
      src = fetchgit {
        name = "rmf_workcell_msgs-14ab76a1d4b734908c0d8c91e39acf4417ab6006-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "14ab76a1d4b734908c0d8c91e39acf4417ab6006";
        hash = "sha256-vdhgQpCZUTplR3Uz68OMF+gsVwlSeIebTzJ22a7Tcw8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_workcell_msgs";
  version = "3.4.0-1";
  src = sources.rmf_workcell_msgs-14ab76a1d4b734908c0d8c91e39acf4417ab6006;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package containing messages used by all workcells generically to interfact with rmf_core";
  };
}
