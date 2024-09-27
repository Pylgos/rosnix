{
  ament_cmake_auto,
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
  substituteSource,
}:
let
  sources = rec {
    autoware_control_msgs-3e93b73ae267aadd681c6b290c207c713648a02f = substituteSource {
      src = fetchgit {
        name = "autoware_control_msgs-3e93b73ae267aadd681c6b290c207c713648a02f-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "3e93b73ae267aadd681c6b290c207c713648a02f";
        hash = "sha256-ka1LsUG3V5LgaUP4rD7F+n5yk79a9XGUiwqOsERHQO4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "autoware_control_msgs";
  version = "1.1.0-1";
  src = sources.autoware_control_msgs-3e93b73ae267aadd681c6b290c207c713648a02f;
  nativeBuildInputs = [ ament_cmake_auto rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Autoware control messages package.";
  };
}
