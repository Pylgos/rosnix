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
  version = "2.10.0-1";
  src = finalAttrs.passthru.sources."qt_dotgraph";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedBuildInputs = [ python-qt-binding ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pydot" "python3-pygraphviz" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "qt_dotgraph" = substituteSource {
      src = fetchgit {
        name = "qt_dotgraph-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "abd4807d9c66e9ae3466ebe74dddfb0be7d39127";
        hash = "sha256-QDWTRefZgp69DF52q1P7tiu2HP0qx/lnq3ZCxSGZ1gE=";
      };
    };
  });
  meta = {
    description = "qt_dotgraph provides helpers to work with dot graphs.";
  };
})
