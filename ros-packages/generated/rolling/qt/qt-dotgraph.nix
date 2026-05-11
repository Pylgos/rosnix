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
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."qt_dotgraph";
  propagatedNativeBuildInputs = [ python-qt-binding ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pydot" "python3-pygraphviz" ]; };
  propagatedBuildInputs = [ python-qt-binding ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pydot" "python3-pygraphviz" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "qt_dotgraph" = substituteSource {
      src = fetchgit {
        name = "qt_dotgraph-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "c0306cc5002afbfec04c4cc0e6489398b8ad2cfd";
        hash = "sha256-nrzz3zT8MYTVBF99Ua0mdFVcD9cD8WSn8/VvwOPbcC4=";
      };
    };
  });
  meta = {
    description = "\n    qt_dotgraph provides helpers to work with dot graphs.\n  ";
  };
})
