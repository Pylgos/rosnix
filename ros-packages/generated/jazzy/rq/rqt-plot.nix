{
  ament-copyright,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-qt-binding,
  qt-gui-py-common,
  rclpy,
  rosSystemPackages,
  rosidl-runtime-py,
  rqt-gui,
  rqt-gui-py,
  rqt-py-common,
  std-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_plot";
  version = "1.4.3-1";
  src = finalAttrs.passthru.sources."rqt_plot";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ python-qt-binding qt-gui-py-common rclpy rosidl-runtime-py rqt-gui rqt-gui-py rqt-py-common std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-catkin-pkg-modules" "python3-matplotlib" "python3-numpy" ]; };
  propagatedBuildInputs = [ python-qt-binding qt-gui-py-common rclpy rosidl-runtime-py rqt-gui rqt-gui-py rqt-py-common std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-catkin-pkg-modules" "python3-matplotlib" "python3-numpy" ]; };
  checkInputs = [ ament-copyright ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_plot" = substituteSource {
      src = fetchgit {
        name = "rqt_plot-source";
        url = "https://github.com/ros2-gbp/rqt_plot-release.git";
        rev = "2fc68db3b7a7ade7db6cbc076ac3ea28e67e8765";
        hash = "sha256-c5turtB/fC4ndwbkidQrdEvQjg0C1RS4KEtH541ARLE=";
      };
    };
  });
  meta = {
    description = "rqt_plot provides a GUI plugin visualizing numeric values in a 2D plot using different plotting backends.";
  };
})
