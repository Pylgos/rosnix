{
  ament_cmake,
  buildRosPackage,
  costmap_queue,
  dwb_core,
  dwb_critics,
  dwb_msgs,
  dwb_plugins,
  fetchgit,
  fetchurl,
  fetchzip,
  nav_2d_msgs,
  nav_2d_utils,
  substituteSource,
}:
let
  sources = rec {
    nav2_dwb_controller = substituteSource {
      src = fetchgit {
        name = "nav2_dwb_controller-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
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
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ costmap_queue dwb_core dwb_critics dwb_msgs dwb_plugins nav_2d_msgs nav_2d_utils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "ROS2 controller (DWB) metapackage";
  };
}
