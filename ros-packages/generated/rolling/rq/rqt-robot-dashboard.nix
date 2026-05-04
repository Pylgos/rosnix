{
  buildAmentPythonPackage,
  diagnostic-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-qt-binding,
  qt-gui,
  rclpy,
  rosSystemPackages,
  rqt-console,
  rqt-gui,
  rqt-gui-py,
  rqt-robot-monitor,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_robot_dashboard";
  version = "0.6.1-5";
  src = finalAttrs.passthru.sources."rqt_robot_dashboard";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-setuptools" ]; };
  propagatedNativeBuildInputs = [ diagnostic-msgs python-qt-binding qt-gui rclpy rqt-console rqt-gui rqt-gui-py rqt-robot-monitor ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-setuptools" ]; };
  propagatedBuildInputs = [ diagnostic-msgs python-qt-binding qt-gui rclpy rqt-console rqt-gui rqt-gui-py rqt-robot-monitor ];
  passthru.sources = mkSourceSet (sources: {
    "rqt_robot_dashboard" = substituteSource {
      src = fetchgit {
        name = "rqt_robot_dashboard-source";
        url = "https://github.com/ros2-gbp/rqt_robot_dashboard-release.git";
        rev = "8c2c34df1f93a8055f1ef5f4e252f12b5a4560ff";
        hash = "sha256-o2FskVGSpDLTcYD8PlfRgHpBlDa3UId/Xq+IlAvaZGY=";
      };
    };
  });
  meta = {
    description = "rqt_robot_dashboard provides an infrastructure for building robot dashboard plugins in rqt.";
  };
})
