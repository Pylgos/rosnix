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
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtle_nest";
  version = "1.0.2-1";
  src = finalAttrs.passthru.sources."turtle_nest";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-gui" "libqt5-opengl" "libqt5-widgets" "qtbase5-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "turtle_nest" = substituteSource {
        src = fetchgit {
          name = "turtle_nest-source";
          url = "https://github.com/ros2-gbp/turtle_nest-release.git";
          rev = "cc068c80ccb7397108d36b842a688a3873174b01";
          hash = "sha256-ZOCujpxbSs8G7iK430a6Q5AzSeAzQ5Dh2CfDIZ1XlAY=";
        };
      };
    });
  };
  meta = {
    description = "ROS 2 Package Creator";
  };
})
