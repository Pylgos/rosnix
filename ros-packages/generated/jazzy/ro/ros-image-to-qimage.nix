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
  version = "0.4.1-4";
  src = finalAttrs.passthru.sources."ros_image_to_qimage";
  nativeBuildInputs = [ ament-cmake ament-cmake-pytest ament-cmake-python wrapRosQtAppsHook ];
  propagatedBuildInputs = [ cv-bridge python-qt-binding sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qtbase5-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ros_image_to_qimage" = substituteSource {
      src = fetchgit {
        name = "ros_image_to_qimage-source";
        url = "https://github.com/ros2-gbp/ros_image_to_qimage-release.git";
        rev = "73eb2db321f27aab67b475a236a19607124896be";
        hash = "sha256-qxt94vxyKVhWR64DyvjU5D5xKcJcflZdDd/jA2e0d9U=";
      };
    };
  });
  meta = {
    description = "A package that converts a ros image msg to a qimage object";
  };
})
