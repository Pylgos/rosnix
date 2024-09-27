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
    diagnostic_msgs-2acf941fd8d1ca0aa5e22de6dbaee01208471ecb = substituteSource {
      src = fetchgit {
        name = "diagnostic_msgs-2acf941fd8d1ca0aa5e22de6dbaee01208471ecb-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "2acf941fd8d1ca0aa5e22de6dbaee01208471ecb";
        hash = "sha256-VaNM6gL1W9xv0Z4CsOxSt4rBRHODNb3jf8pvyhdfjI8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "diagnostic_msgs";
  version = "5.3.5-1";
  src = sources.diagnostic_msgs-2acf941fd8d1ca0aa5e22de6dbaee01208471ecb;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package containing some diagnostics related message and service definitions.";
  };
}
