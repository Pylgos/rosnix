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
  version = "5.0.2-1";
  src = finalAttrs.passthru.sources."rqt_joint_trajectory_controller";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ control-msgs controller-manager-msgs python-qt-binding qt-gui rclpy rqt-gui rqt-gui-py trajectory-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-rospkg" ]; };
  propagatedBuildInputs = [ control-msgs controller-manager-msgs python-qt-binding qt-gui rclpy rqt-gui rqt-gui-py trajectory-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-rospkg" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_joint_trajectory_controller" = substituteSource {
      src = fetchgit {
        name = "rqt_joint_trajectory_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "2e3e0439a44c1d05f9e64eb65c0311a4c000c7ec";
        hash = "sha256-ezbTWOBZdHNaODJKw2NgCD3k1Y8P3pd7Xe8vUl0Ij2c=";
      };
    };
  });
  meta = {
    description = "Graphical frontend for interacting with joint_trajectory_controller instances.";
  };
})
