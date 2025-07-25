{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "py_trees_js";
  version = "0.6.6-2";
  src = finalAttrs.passthru.sources."py_trees_js";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "pyqt5-dev-tools" "python3-pyqt5.qtwebengine" "python3-qt5-bindings" "python3-setuptools" "qttools5-dev-tools" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "pyqt5-dev-tools" "python3-pyqt5.qtwebengine" "python3-qt5-bindings" "python3-setuptools" "qttools5-dev-tools" ]; };
  passthru.sources = mkSourceSet (sources: {
    "py_trees_js" = substituteSource {
      src = fetchgit {
        name = "py_trees_js-source";
        url = "https://github.com/ros2-gbp/py_trees_js-release.git";
        rev = "b5eb3d524e2cb026fe0177c70ee3e365a08d84c8";
        hash = "sha256-Hvs8kHpAOZqwP/2KMoTEM/DHf5Gja9RdiVF2xFwDUxs=";
      };
    };
  });
  meta = {
    description = "\n    Javascript library for visualising behaviour trees.\n  ";
  };
})
