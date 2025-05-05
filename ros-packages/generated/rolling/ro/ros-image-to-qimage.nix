{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-qt-binding,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros_image_to_qimage";
  version = "0.4.1-3";
  src = finalAttrs.passthru.sources."ros_image_to_qimage";
  nativeBuildInputs = [ ament-cmake ament-cmake-pytest ament-cmake-python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ cv-bridge python-qt-binding sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-pytest ament-cmake-python ];
  propagatedBuildInputs = [ cv-bridge python-qt-binding sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qtbase5-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ros_image_to_qimage" = substituteSource {
      src = fetchgit {
        name = "ros_image_to_qimage-source";
        url = "https://github.com/ros2-gbp/ros_image_to_qimage-release.git";
        rev = "5f468c90083c075edb30b8ec93f78561c542cd1a";
        hash = "sha256-qxt94vxyKVhWR64DyvjU5D5xKcJcflZdDd/jA2e0d9U=";
      };
    };
  });
  meta = {
    description = "A package that converts a ros image msg to a qimage object";
  };
})
