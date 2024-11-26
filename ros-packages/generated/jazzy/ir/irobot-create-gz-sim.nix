{
  ament-cmake,
  buildAmentCmakePackage,
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
buildAmentCmakePackage (finalAttrs: {
  pname = "irobot_create_gz_sim";
  version = "3.0.4-1";
  src = finalAttrs.passthru.sources."irobot_create_gz_sim";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ irobot-create-gz-bringup irobot-create-gz-plugins irobot-create-gz-toolbox ];
  passthru.sources = mkSourceSet (sources: {
    "irobot_create_gz_sim" = substituteSource {
      src = fetchgit {
        name = "irobot_create_gz_sim-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "fc5a8310ab8b4198515a405823322ca513bff7a5";
        hash = "sha256-X/qSLuG5bLKrKBl/0G2qY9acHLR1A3+wQ/zK6GXhsfs=";
      };
    };
  });
  meta = {
    description = "Metapackage for the iRobot(R) Create(R) 3 robot Ignition simulator";
  };
})
