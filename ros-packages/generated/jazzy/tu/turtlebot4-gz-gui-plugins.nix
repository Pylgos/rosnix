{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz-gui-vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot4_gz_gui_plugins";
  version = "2.0.2-1";
  src = finalAttrs.passthru.sources."turtlebot4_gz_gui_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ gz-gui-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qml-module-qtquick-extras" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "turtlebot4_gz_gui_plugins" = substituteSource {
        src = fetchgit {
          name = "turtlebot4_gz_gui_plugins-source";
          url = "https://github.com/ros2-gbp/turtlebot4_simulator-release.git";
          rev = "ea801cd26ee4e6ee4181e3c3c3b020fbb50ecffe";
          hash = "sha256-fPdPEFX5PZeLRhZQaUUpHBucllJJpIcF4Xrq4opR848=";
        };
      };
    });
  };
  meta = {
    description = "Turtlebot4 Gazebo Simulator GUI Plugins";
  };
})
