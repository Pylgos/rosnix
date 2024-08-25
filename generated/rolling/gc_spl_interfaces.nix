{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    gc_spl_interfaces = substituteSource {
      src = fetchgit {
        name = "gc_spl_interfaces-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "40ceafe3b472fb84d11e1e50ab4458723e2638bf";
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
  src = sources.gc_spl_interfaces;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "RoboCup SPL GameController Data ROS msg";
  };
}
