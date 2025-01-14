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
  version = "0.6.5-1";
  src = finalAttrs.passthru.sources."py_trees_js";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-setuptools" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "pyqt5-dev-tools" "python3-pyqt5.qtwebengine" "python3-qt5-bindings" "qttools5-dev-tools" ]; };
  passthru.sources = mkSourceSet (sources: {
    "py_trees_js" = substituteSource {
      src = fetchgit {
        name = "py_trees_js-source";
        url = "https://github.com/ros2-gbp/py_trees_js-release.git";
        rev = "15f31d556c0cf8fb7dfa36114b0a8955ba6bd839";
        hash = "sha256-Ufq04Ehkn76EZtrmQf5OXwNkOeCowQJxqGPS/irK5y4=";
      };
    };
  });
  meta = {
    description = "Javascript library for visualising behaviour trees.";
  };
})
