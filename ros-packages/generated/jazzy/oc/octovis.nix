{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  octomap,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildCmakePackage (finalAttrs: {
  pname = "octovis";
  version = "1.10.0-4";
  src = finalAttrs.passthru.sources."octovis";
  nativeBuildInputs = [ wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ octomap ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqglviewer-dev-qt5" "libqglviewer2-qt5" "libqt5-core" "libqt5-gui" "libqt5-opengl" "libqt5-opengl-dev" "opengl" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "octovis" = substituteSource {
        src = fetchgit {
          name = "octovis-source";
          url = "https://github.com/ros2-gbp/octomap-release.git";
          rev = "5e9de4466ea20bce487a9d3a30a5294567904faa";
          hash = "sha256-TxMKU0t80X4leyZ3fdp6/PWCKK9UQhv7DITRuosz9Xw=";
        };
      };
    });
  };
  meta = {
    description = "octovis is visualization tool for the OctoMap library based on Qt and libQGLViewer. See http://octomap.github.io for details.";
  };
})
