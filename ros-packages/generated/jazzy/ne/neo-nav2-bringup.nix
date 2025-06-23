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
  version = "1.3.1-1";
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
        rev = "fa56a3274e0473fe7fbd0cef2d2f9345b1212678";
        hash = "sha256-4TneDUFoLo4siJaKo3SLlokp1aIa3fsxXcnEarJAbwg=";
      };
    };
  });
  meta = {
    description = "ROS-2 navigation bringup packages for neobotix robots";
  };
})
