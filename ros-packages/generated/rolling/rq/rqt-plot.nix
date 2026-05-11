{
  ament-copyright,
  ament-flake8,
  ament-index-python,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-qt-binding,
  qt-gui-py-common,
  rclpy,
  rosSystemPackages,
  rosidl-parser,
  rosidl-runtime-py,
  rqt-gui,
  rqt-gui-py,
  rqt-py-common,
  std-msgs,
  substituteSource,
  test-msgs,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_plot";
  version = "2.0.0-2";
  src = finalAttrs.passthru.sources."rqt_plot";
  propagatedNativeBuildInputs = [ ament-index-python python-qt-binding qt-gui-py-common rclpy rosidl-parser rosidl-runtime-py rqt-gui rqt-gui-py rqt-py-common std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libqtwidgets" "python3-matplotlib" "python3-numpy" "qt-base-dev" ]; };
  propagatedBuildInputs = [ ament-index-python python-qt-binding qt-gui-py-common rclpy rosidl-parser rosidl-runtime-py rqt-gui rqt-gui-py rqt-py-common std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqtwidgets" "python3-matplotlib" "python3-numpy" "qt-base-dev" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint test-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_plot" = substituteSource {
      src = fetchgit {
        name = "rqt_plot-source";
        url = "https://github.com/ros2-gbp/rqt_plot-release.git";
        rev = "cea0a235ff74189ba526d2aea7635441ec0dbf1d";
        hash = "sha256-vPzTdAYtvDnS/ur+Ylw5EnSh4q51B1+63m3QHZfOyA0=";
      };
    };
  });
  meta = {
    description = "rqt_plot provides a GUI plugin visualizing numeric values in a 2D plot using different plotting backends.";
  };
})
