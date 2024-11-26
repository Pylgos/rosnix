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
  rqt-gui,
  rqt-gui-py,
  rqt-py-common,
  std-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_plot";
  version = "1.5.0-1";
  src = finalAttrs.passthru.sources."rqt_plot";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-catkin-pkg-modules" ]; };
  propagatedBuildInputs = [ python-qt-binding qt-gui-py-common rclpy rqt-gui rqt-gui-py rqt-py-common std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-matplotlib" "python3-numpy" ]; };
  checkInputs = [ ament-copyright ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_plot" = substituteSource {
      src = fetchgit {
        name = "rqt_plot-source";
        url = "https://github.com/ros2-gbp/rqt_plot-release.git";
        rev = "52f8e3aba192bc6b53bf11694e14db186806e32a";
        hash = "sha256-RSUNEl7XsDbe5ADnnFE4RcoGUzyO/JsEkqMF10Cs94w=";
      };
    };
  });
  meta = {
    description = "rqt_plot provides a GUI plugin visualizing numeric values in a 2D plot using different plotting backends.";
  };
})
