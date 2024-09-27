{
  ament_cmake,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  qt_gui,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    qt_gui_app-3930bb62257a42688018d6f9c6e445fc670f1946 = substituteSource {
      src = fetchgit {
        name = "qt_gui_app-3930bb62257a42688018d6f9c6e445fc670f1946-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "3930bb62257a42688018d6f9c6e445fc670f1946";
        hash = "sha256-OU68D6ke+OYEcT00UuAmVxqOKUeC5NEf4XwD7qMKLMI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "qt_gui_app";
  version = "2.7.4-2";
  src = sources.qt_gui_app-3930bb62257a42688018d6f9c6e445fc670f1946;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_python qt_gui ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "qt_gui_app provides the main to start an instance of the integrated graphical user interface provided by qt_gui.";
  };
}
