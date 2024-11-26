{
  ament-index-python,
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
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_publisher";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."rqt_publisher";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedBuildInputs = [ ament-index-python python-qt-binding qt-gui-py-common rclpy rosidl-runtime-py rqt-gui rqt-gui-py rqt-py-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_publisher" = substituteSource {
      src = fetchgit {
        name = "rqt_publisher-source";
        url = "https://github.com/ros2-gbp/rqt_publisher-release.git";
        rev = "8844b832555fa96de8688659d91992e2180d09e2";
        hash = "sha256-Hr9Qhn2z572Ykp1NChlwggFvx2V4fj8zznV9cKv9gj0=";
      };
    };
  });
  meta = {
    description = "rqt_publisher provides a GUI plugin for publishing arbitrary messages with fixed or computed field values.";
  };
})
