{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  tinyxml2-vendor,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtle_nest";
  version = "1.2.0-1";
  src = finalAttrs.passthru.sources."turtle_nest";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ tinyxml2-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "black" "libqt5-core" "libqt5-gui" "libqt5-opengl" "libqt5-svg-dev" "libqt5-widgets" "pybind11-dev" "python3-dev" "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ tinyxml2-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "black" "libqt5-core" "libqt5-gui" "libqt5-opengl" "libqt5-svg-dev" "libqt5-widgets" "pybind11-dev" "python3-dev" "qtbase5-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "turtle_nest" = substituteSource {
      src = fetchgit {
        name = "turtle_nest-source";
        url = "https://github.com/ros2-gbp/turtle_nest-release.git";
        rev = "f914e9ea9b09e78845e73c19c0a3975d6b976df9";
        hash = "sha256-9zyNcmDjlEle8DFyhgTe+Czpfcp3VoD0ISMXfQRH8Gw=";
      };
    };
  });
  meta = {
    description = "ROS 2 Package Creator";
  };
})
