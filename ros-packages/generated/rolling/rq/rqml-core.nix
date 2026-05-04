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
  version = "3.26.42-2";
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
        rev = "b91dc85d56f2b0b1a7d157db35aa60c517980db6";
        hash = "sha256-22DSTxT6LrVRG23TsLqq/Ke38p6wCeVgU+z1UgbIe4E=";
      };
    };
  });
  meta = {
    description = "QML-based robotics visualization and control tool for ROS 2.";
  };
})
