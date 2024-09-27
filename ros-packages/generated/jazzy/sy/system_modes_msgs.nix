{
  ament_cmake,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
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
    system_modes_msgs-0ca34ba1a38941ce091a31331eb78be7520efec9 = substituteSource {
      src = fetchgit {
        name = "system_modes_msgs-0ca34ba1a38941ce091a31331eb78be7520efec9-source";
        url = "https://github.com/ros2-gbp/system_modes-release.git";
        rev = "0ca34ba1a38941ce091a31331eb78be7520efec9";
        hash = "sha256-UcVnvMWo1lcz8PljlXg4m53YoUKsphq4TbfgB7Z3dgw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "system_modes_msgs";
  version = "0.9.0-6";
  src = sources.system_modes_msgs-0ca34ba1a38941ce091a31331eb78be7520efec9;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_cppcheck ament_cmake_cpplint ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Interface package, containing message definitions and service definitions for the system modes package.";
  };
}
