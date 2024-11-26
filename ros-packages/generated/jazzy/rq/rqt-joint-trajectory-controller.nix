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
  version = "4.16.0-1";
  src = finalAttrs.passthru.sources."rqt_joint_trajectory_controller";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-rospkg" ]; };
  propagatedBuildInputs = [ control-msgs controller-manager-msgs python-qt-binding qt-gui rclpy rqt-gui rqt-gui-py trajectory-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rqt_joint_trajectory_controller" = substituteSource {
        src = fetchgit {
          name = "rqt_joint_trajectory_controller-source";
          url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
          rev = "57a93b63d2aba82ae3aaaa7f9e274c1a883ad287";
          hash = "sha256-X0JLPy87QvXM1u9PhsCtxvKrfuDSuB1QU5tHQIczY8g=";
        };
      };
    });
  };
  meta = {
    description = "Graphical frontend for interacting with joint_trajectory_controller instances.";
  };
})
