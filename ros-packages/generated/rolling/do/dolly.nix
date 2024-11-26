{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  dolly-follow,
  dolly-gazebo,
  dolly-ignition,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dolly";
  version = "0.4.0-5";
  src = finalAttrs.passthru.sources."dolly";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ dolly-follow dolly-gazebo dolly-ignition ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "dolly" = substituteSource {
      src = fetchgit {
        name = "dolly-source";
        url = "https://github.com/ros2-gbp/dolly-release.git";
        rev = "d421634724723dfbd39e53d934452d59a55e8336";
        hash = "sha256-1ugxemjgNM3QtSsQ64TCZHu8J9gYPS5Qh2s6VRBTiFA=";
      };
    };
  });
  meta = {
    description = "Meta-package for Dolly, the robot sheep.";
  };
})
