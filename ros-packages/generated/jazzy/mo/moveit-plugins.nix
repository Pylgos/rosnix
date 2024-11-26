{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-simple-controller-manager,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_plugins";
  version = "2.10.0-1";
  src = finalAttrs.passthru.sources."moveit_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ moveit-simple-controller-manager ];
  passthru = {
    sources = mkSourceSet (sources: {
      "moveit_plugins" = substituteSource {
        src = fetchgit {
          name = "moveit_plugins-source";
          url = "https://github.com/ros2-gbp/moveit2-release.git";
          rev = "5141fa4cd1dcf35e61f772376dba2c30930168db";
          hash = "sha256-kPrOE89xIqGfsHcYKSmL7YsJpWCBNDPmdbHY5x0lG1M=";
        };
      };
    });
  };
  meta = {
    description = "Metapackage for MoveIt plugins.";
  };
})
