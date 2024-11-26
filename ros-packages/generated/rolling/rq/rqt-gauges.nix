{
  ament-flake8,
  ament-index-python,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  qt-gui,
  qt-gui-py-common,
  rclpy,
  rosSystemPackages,
  rqt-gui,
  rqt-gui-py,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_gauges";
  version = "0.0.3-1";
  src = finalAttrs.passthru.sources."rqt_gauges";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedBuildInputs = [ ament-index-python qt-gui qt-gui-py-common rclpy rqt-gui rqt-gui-py ];
  checkInputs = [ ament-flake8 ament-xmllint ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rqt_gauges" = substituteSource {
        src = fetchgit {
          name = "rqt_gauges-source";
          url = "https://github.com/ros2-gbp/rqt_gauges-release.git";
          rev = "4a0554e45ca3d3a92a83d66e4695ba18363d358a";
          hash = "sha256-ie5l6SHrK6cQczLp2R3MdzrJRVZGAxGnuO7NzFIwbJY=";
        };
      };
    });
  };
  meta = {
    description = "Visualization plugin for several sensors.";
  };
})
