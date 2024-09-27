{
  ament_cmake,
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
    gc_spl_interfaces-8a8f52cc53fe2489e2143ad6d9c8bbdd1ed6e6a3 = substituteSource {
      src = fetchgit {
        name = "gc_spl_interfaces-8a8f52cc53fe2489e2143ad6d9c8bbdd1ed6e6a3-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "8a8f52cc53fe2489e2143ad6d9c8bbdd1ed6e6a3";
        hash = "sha256-zib/AEpu2CDmpEXFyiedKxZD52Ub6+OPzPJpw/a2jqE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gc_spl_interfaces";
  version = "4.0.1-1";
  src = sources.gc_spl_interfaces-8a8f52cc53fe2489e2143ad6d9c8bbdd1ed6e6a3;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "RoboCup SPL GameController Data ROS msg";
  };
}
