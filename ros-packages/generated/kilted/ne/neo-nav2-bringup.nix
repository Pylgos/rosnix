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
  version = "1.0.4-1";
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
        rev = "88b498dcaf9b66f5d7c8fba107f05ebd1ef4c055";
        hash = "sha256-c0KbkBX1y8EURHo0QhS1n7evahbRynMWT7FzvQwMppo=";
      };
    };
  });
  meta = {
    description = "ROS-2 navigation bringup packages for neobotix robots";
  };
})
