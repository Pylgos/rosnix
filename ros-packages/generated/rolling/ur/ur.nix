{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  ur-calibration,
  ur-controllers,
  ur-dashboard-msgs,
  ur-moveit-config,
  ur-robot-driver,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ur";
  version = "2.4.13-1";
  src = finalAttrs.passthru.sources."ur";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ ur-calibration ur-controllers ur-dashboard-msgs ur-moveit-config ur-robot-driver ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ur" = substituteSource {
      src = fetchgit {
        name = "ur-source";
        url = "https://github.com/ros2-gbp/Universal_Robots_ROS2_Driver-release.git";
        rev = "bbf8446ef92146b40e8e74a3f2375cb2d4274f47";
        hash = "sha256-IJnZJBfgJqHkwQYVO6vZeyH9gziaGf7NDVwGFr7ZSMc=";
      };
    };
  });
  meta = {
    description = "Metapackage for universal robots";
  };
})
