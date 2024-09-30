{
  ament-cmake,
  buildRosPackage,
  costmap-queue,
  dwb-core,
  dwb-critics,
  dwb-msgs,
  dwb-plugins,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nav-2d-msgs,
  nav-2d-utils,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "nav2_dwb_controller" = substituteSource {
      src = fetchgit {
        name = "nav2_dwb_controller-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "f269677c6724cda66e55cb5faac15aff7d76572e";
        hash = "sha256-Y2qarGuMEC/NGv+FBsZPlQmjjaRBr1FP1y+ou0E2dfo=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "nav2_dwb_controller";
  version = "1.3.2-1";
  src = sources."nav2_dwb_controller";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ costmap-queue dwb-core dwb-critics dwb-msgs dwb-plugins nav-2d-msgs nav-2d-utils ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS2 controller (DWB) metapackage";
  };
}
