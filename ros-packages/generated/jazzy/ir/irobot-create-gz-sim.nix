{
  ament-cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  irobot-create-gz-bringup,
  irobot-create-gz-plugins,
  irobot-create-gz-toolbox,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "irobot_create_gz_sim" = substituteSource {
      src = fetchgit {
        name = "irobot_create_gz_sim-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "18ca00151a53ffd3dc0cf9e3fddc70557afefa3a";
        hash = "sha256-9AFKzpIiDao1VdiUtFdGeNCq2HNnIJd+NJ4+Gxm0ziw=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "irobot_create_gz_sim";
  version = "3.0.3-1";
  src = sources."irobot_create_gz_sim";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ irobot-create-gz-bringup irobot-create-gz-plugins irobot-create-gz-toolbox ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Metapackage for the iRobot(R) Create(R) 3 robot Ignition simulator";
  };
}
