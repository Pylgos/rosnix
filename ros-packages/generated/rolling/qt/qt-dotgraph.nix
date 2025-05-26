{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-qt-binding,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "qt_dotgraph";
  version = "2.10.1-1";
  src = finalAttrs.passthru.sources."qt_dotgraph";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ python-qt-binding ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pydot" "python3-pygraphviz" ]; };
  propagatedBuildInputs = [ python-qt-binding ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pydot" "python3-pygraphviz" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "qt_dotgraph" = substituteSource {
      src = fetchgit {
        name = "qt_dotgraph-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "92272be7b78372c65f3fd4f8410667bb149ae427";
        hash = "sha256-w5i4v3fyLjsLC9BzkLF2jZy1nDRqUMvzk5bxZGH7Em8=";
      };
    };
  });
  meta = {
    description = "\n    qt_dotgraph provides helpers to work with dot graphs.\n  ";
  };
})
