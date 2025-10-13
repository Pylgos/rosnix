{
  ament-lint-auto,
  ament-lint-common,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  qt-gui,
  rosSystemPackages,
  rqt-gui,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_gui_py";
  version = "1.6.1-1";
  src = finalAttrs.passthru.sources."rqt_gui_py";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ qt-gui rqt-gui ];
  propagatedBuildInputs = [ qt-gui rqt-gui ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rqt_gui_py" = substituteSource {
      src = fetchgit {
        name = "rqt_gui_py-source";
        url = "https://github.com/ros2-gbp/rqt-release.git";
        rev = "74466a68ec4c06fca94d72bb9916b224d0780d07";
        hash = "sha256-cwR5rEjLuhqm4+wKwOTl9ZCVnCE5Kd/JVAi3ncw2B80=";
      };
    };
  });
  meta = {
    description = "rqt_gui_py enables GUI plugins to use the Python client library for ROS.";
  };
})
