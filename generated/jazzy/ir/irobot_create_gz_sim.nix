{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  irobot_create_gz_bringup,
  irobot_create_gz_plugins,
  irobot_create_gz_toolbox,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    irobot_create_gz_sim = substituteSource {
      src = fetchgit {
        name = "irobot_create_gz_sim-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "bd9d6fef40229100cecbc73ed254edb7fc74dc8b";
        hash = "sha256-eVP7A7qA3mDxp80/uCb22CeHuHvF7ZFge9rTmybsn7o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "irobot_create_gz_sim";
  version = "3.0.2-2";
  src = sources.irobot_create_gz_sim;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ irobot_create_gz_bringup irobot_create_gz_plugins irobot_create_gz_toolbox ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Metapackage for the iRobot(R) Create(R) 3 robot Ignition simulator";
  };
}
