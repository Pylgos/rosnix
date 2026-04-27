{
  ament-cmake,
  ament-index-cpp,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  qml6-ros2-plugin,
  ros-babel-fish-test-msgs,
  rosSystemPackages,
  substituteSource,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rqml_core";
  version = "3.26.41-1";
  src = finalAttrs.passthru.sources."rqml_core";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp qml6-ros2-plugin yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libqt6-core" "libqt6-qml" "libqt6-quick" "nlohmann-json-dev" "opengl" "qml6-module-qtcore" "qml6-module-qtqml-models" "qml6-module-qtqml-workerscript" "qml6-module-qtquick-controls" "qml6-module-qtquick-layouts" "qml6-module-qtquick-templates" "qml6-module-qtquick-window" "qt6-base-dev" "qt6-base-private-dev" "qt6-declarative-dev" "qt6-declarative-private-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp qml6-ros2-plugin yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt6-core" "libqt6-qml" "libqt6-quick" "nlohmann-json-dev" "opengl" "qml6-module-qtcore" "qml6-module-qtqml-models" "qml6-module-qtqml-workerscript" "qml6-module-qtquick-controls" "qml6-module-qtquick-layouts" "qml6-module-qtquick-templates" "qml6-module-qtquick-window" "qt6-base-dev" "qt6-base-private-dev" "qt6-declarative-dev" "qt6-declarative-private-dev" ]; };
  checkInputs = [ ament-lint-auto ros-babel-fish-test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rqml_core" = substituteSource {
      src = fetchgit {
        name = "rqml_core-source";
        url = "https://github.com/ros2-gbp/rqml-release.git";
        rev = "b3f9ad6415962e8105a6e229ea2be1df28b7c3df";
        hash = "sha256-Q//DH1fgfiPeu04ikvQwpbxj5yGLNp0+LucbZCAgOyw=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/KDAB/KDDockWidgets.git";
          to = "URL ${sources."rqml_core/KDDockWidgets"}";
        }
      ];
    };
    "rqml_core/KDDockWidgets" = substituteSource {
      src = fetchgit {
        name = "KDDockWidgets-source";
        url = "https://github.com/KDAB/KDDockWidgets.git";
        rev = "c38711026e17e34916dd82c6fcbdcc0d2342f541";
        hash = "sha256-NNGIR2MTaNs2zFeN9vmHxoRuss2IR7FQ8F34b00L9z4=";
      };
    };
  });
  meta = {
    description = "QML-based robotics visualization and control tool for ROS 2.";
  };
})
