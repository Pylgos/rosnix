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
  version = "3.3.2-1";
  src = finalAttrs.passthru.sources."ur";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ur-calibration ur-controllers ur-dashboard-msgs ur-moveit-config ur-robot-driver ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ur-calibration ur-controllers ur-dashboard-msgs ur-moveit-config ur-robot-driver ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ur" = substituteSource {
      src = fetchgit {
        name = "ur-source";
        url = "https://github.com/ros2-gbp/Universal_Robots_ROS2_Driver-release.git";
        rev = "dc9fb38fd66db56356b0494befa0b93682c37bea";
        hash = "sha256-q3iXDVbDozt1iAFNMxpUSDy06eCBJ9UNrbdAip7oV4A=";
      };
    };
  });
  meta = {
    description = "Metapackage for universal robots";
  };
})
