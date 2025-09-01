{
  buildAmentPythonPackage,
  control-msgs,
  controller-manager-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-qt-binding,
  qt-gui,
  rclpy,
  rosSystemPackages,
  rqt-gui,
  rqt-gui-py,
  substituteSource,
  trajectory-msgs,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_joint_trajectory_controller";
  version = "4.31.0-1";
  src = finalAttrs.passthru.sources."rqt_joint_trajectory_controller";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ control-msgs controller-manager-msgs python-qt-binding qt-gui rclpy rqt-gui rqt-gui-py trajectory-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-rospkg" ]; };
  propagatedBuildInputs = [ control-msgs controller-manager-msgs python-qt-binding qt-gui rclpy rqt-gui rqt-gui-py trajectory-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-rospkg" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_joint_trajectory_controller" = substituteSource {
      src = fetchgit {
        name = "rqt_joint_trajectory_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "dc4f24d8982142267ed1a8e648c7123a9f2e36f3";
        hash = "sha256-7iUcUXO99e5YHMgb2+ZWv+NwH+y1yKNr/0NQFUGHdp4=";
      };
    };
  });
  meta = {
    description = "Graphical frontend for interacting with joint_trajectory_controller instances.";
  };
})
