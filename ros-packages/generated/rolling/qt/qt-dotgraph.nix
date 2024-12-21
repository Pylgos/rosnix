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
  version = "2.9.0-1";
  src = finalAttrs.passthru.sources."qt_dotgraph";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedBuildInputs = [ python-qt-binding ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pydot" "python3-pygraphviz" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "qt_dotgraph" = substituteSource {
      src = fetchgit {
        name = "qt_dotgraph-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "371b975caa22ec54f0c1a893291b27ff1fc20602";
        hash = "sha256-hUUcU0GGvvquFGdV8CXQFmGrNjwYKP6YjD7WarKBboY=";
      };
    };
  });
  meta = {
    description = "qt_dotgraph provides helpers to work with dot graphs.";
  };
})
