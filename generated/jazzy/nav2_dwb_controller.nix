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
        rev = "0c62361b3023e556e3487961c0b0210669565842";
        hash = "sha256-mwL2g04Vs3SdQlNtuvfgQS+xPpfsTARKoTOXTNuqeYw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_dwb_controller";
  version = "1.3.1-1";
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
