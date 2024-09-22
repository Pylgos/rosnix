{
  ament_cmake,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  pluginlib,
  python_qt_binding,
  qt_gui,
  rosSystemPackages,
  substituteSource,
  tinyxml2_vendor,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    qt_gui_cpp = substituteSource {
      src = fetchFromGitHub {
        name = "qt_gui_cpp-source";
        owner = "ros2-gbp";
        repo = "qt_gui_core-release";
        rev = "ede91bc8c828c3c820949762acc3b5622b349556";
        hash = "sha256-IPnka0VvvMkzliQpEE2Zwec+wE4scop/YLug0zQxL9Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "qt_gui_cpp";
  version = "2.8.2-1";
  src = sources.qt_gui_cpp;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ pluginlib python_qt_binding qt_gui tinyxml2_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qt5-qmake" "qtbase5-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_pytest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "qt_gui_cpp provides the foundation for C++-bindings for qt_gui and creates bindings for every generator available. At least one specific binding must be available in order to use C++-plugins.";
  };
}
