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
  version = "2.13.0-1";
  src = finalAttrs.passthru.sources."moveit_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ moveit-simple-controller-manager ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_plugins" = substituteSource {
      src = fetchgit {
        name = "moveit_plugins-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "842fdb3e7f8d7af03bdf7bcfac1ed9f3dfc083be";
        hash = "sha256-LUXGmlNZ5f59fkzK2LHYL3zoFi5YP5mXOMrlH4sqodc=";
      };
    };
  });
  meta = {
    description = "Metapackage for MoveIt plugins.";
  };
})
