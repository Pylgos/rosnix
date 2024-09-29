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
        rev = "bd9d6fef40229100cecbc73ed254edb7fc74dc8b";
        hash = "sha256-eVP7A7qA3mDxp80/uCb22CeHuHvF7ZFge9rTmybsn7o=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "irobot-create-gz-sim";
  version = "3.0.2-2";
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
