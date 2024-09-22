{
  ament_cmake,
  buildRosPackage,
  costmap_queue,
  dwb_core,
  dwb_critics,
  dwb_msgs,
  dwb_plugins,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  nav_2d_msgs,
  nav_2d_utils,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    nav2_dwb_controller = substituteSource {
      src = fetchFromGitHub {
        name = "nav2_dwb_controller-source";
        owner = "SteveMacenski";
        repo = "navigation2-release";
        rev = "f269677c6724cda66e55cb5faac15aff7d76572e";
        hash = "sha256-Y2qarGuMEC/NGv+FBsZPlQmjjaRBr1FP1y+ou0E2dfo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_dwb_controller";
  version = "1.3.2-1";
  src = sources.nav2_dwb_controller;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ costmap_queue dwb_core dwb_critics dwb_msgs dwb_plugins nav_2d_msgs nav_2d_utils ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS2 controller (DWB) metapackage";
  };
}
