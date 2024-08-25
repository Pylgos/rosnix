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
    rcgcrd_spl_4 = substituteSource {
      src = fetchgit {
        name = "rcgcrd_spl_4-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "1a4163d230639126421ebff6381f7887eba98caa";
        hash = "sha256-du68Eq0gNlBSz8RHUaKfCmnCe4dMuBRNBVY/Xr+/+cU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcgcrd_spl_4";
  version = "4.0.1-1";
  src = sources.rcgcrd_spl_4;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "RoboCup SPL GameController Return Data V4 ROS msg";
  };
}
