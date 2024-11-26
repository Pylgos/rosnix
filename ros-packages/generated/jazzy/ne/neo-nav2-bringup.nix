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
  version = "1.3.0-1";
  src = finalAttrs.passthru.sources."neo_nav2_bringup";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ nav2-common navigation2 slam-toolbox ];
  passthru = {
    sources = mkSourceSet (sources: {
      "neo_nav2_bringup" = substituteSource {
        src = fetchgit {
          name = "neo_nav2_bringup-source";
          url = "https://github.com/ros2-gbp/neo_nav2_bringup-release.git";
          rev = "21909124082b13151eeaa87d9396a733f822d50a";
          hash = "sha256-OR5lP0VCH4/nDhPyyI4FbC1yDHOYDp5OxZGI0QVeb8k=";
        };
      };
    });
  };
  meta = {
    description = "ROS-2 navigation bringup packages for neobotix robots";
  };
})
