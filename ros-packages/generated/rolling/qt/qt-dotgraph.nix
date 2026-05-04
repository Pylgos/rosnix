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
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "qt_dotgraph";
  version = "2.10.7-2";
  src = finalAttrs.passthru.sources."qt_dotgraph";
  propagatedNativeBuildInputs = [ python-qt-binding ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pydot" "python3-pygraphviz" ]; };
  propagatedBuildInputs = [ python-qt-binding ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pydot" "python3-pygraphviz" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "qt_dotgraph" = substituteSource {
      src = fetchgit {
        name = "qt_dotgraph-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "ca80d86ac1080872f2f848b9983a01f1b79a2f7c";
        hash = "sha256-G46HgdobobvOHc2wbJeipBntwhVxjHT0ZRG0BYSVE8w=";
      };
    };
  });
  meta = {
    description = "\n    qt_dotgraph provides helpers to work with dot graphs.\n  ";
  };
})
