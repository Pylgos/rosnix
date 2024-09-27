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
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    bond-82d969fd8e47936b242a110a50c59f27eeadc253 = substituteSource {
      src = fetchgit {
        name = "bond-82d969fd8e47936b242a110a50c59f27eeadc253-source";
        url = "https://github.com/ros2-gbp/bond_core-release.git";
        rev = "82d969fd8e47936b242a110a50c59f27eeadc253";
        hash = "sha256-HumzPokICAnb7HyYW4rIhMDSZ8ZnZ+tzQ6LqYn9/dDU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "bond";
  version = "4.1.0-1";
  src = sources.bond-82d969fd8e47936b242a110a50c59f27eeadc253;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A bond allows two processes, A and B, to know when the other has terminated, either cleanly or by crashing. The bond remains connected until it is either broken explicitly or until a heartbeat times out.";
  };
}
