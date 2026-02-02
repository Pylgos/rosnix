{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nav2-common,
  navigation2,
  rosSystemPackages,
  slam-toolbox,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "neo_nav2_bringup";
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."neo_nav2_bringup";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ nav2-common navigation2 slam-toolbox ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ nav2-common navigation2 slam-toolbox ];
  passthru.sources = mkSourceSet (sources: {
    "neo_nav2_bringup" = substituteSource {
      src = fetchgit {
        name = "neo_nav2_bringup-source";
        url = "https://github.com/ros2-gbp/neo_nav2_bringup-release.git";
        rev = "139ec1d419c9366fd0756d1e9bd459310a3a45cc";
        hash = "sha256-XeNDW8u07IpYFfjJyVDLkCVcMKsN2FjdMwYJrQOtKz4=";
      };
    };
  });
  meta = {
    description = "ROS-2 navigation bringup packages for neobotix robots";
  };
})
