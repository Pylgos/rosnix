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
  version = "3.0.1-1";
  src = finalAttrs.passthru.sources."ur";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ ur-calibration ur-controllers ur-dashboard-msgs ur-moveit-config ur-robot-driver ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ur" = substituteSource {
      src = fetchgit {
        name = "ur-source";
        url = "https://github.com/ros2-gbp/Universal_Robots_ROS2_Driver-release.git";
        rev = "75953255868aff501f3c401a8c9cd8a307aea368";
        hash = "sha256-zVRkB48LFDsSiYXDM1bCkY8UQorxSLv9unwvhJe+R5c=";
      };
    };
  });
  meta = {
    description = "Metapackage for universal robots";
  };
})
