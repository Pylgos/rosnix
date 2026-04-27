{
  buildAmentPythonPackage,
  controller-manager,
  controller-manager-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  rqt-gui,
  rqt-gui-py,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_controller_manager";
  version = "5.14.1-1";
  src = finalAttrs.passthru.sources."rqt_controller_manager";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ controller-manager controller-manager-msgs rclpy rqt-gui rqt-gui-py ];
  propagatedBuildInputs = [ controller-manager controller-manager-msgs rclpy rqt-gui rqt-gui-py ];
  passthru.sources = mkSourceSet (sources: {
    "rqt_controller_manager" = substituteSource {
      src = fetchgit {
        name = "rqt_controller_manager-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "20e45afb4a23f12e338e5531d1c7103a2fd59291";
        hash = "sha256-1paOtZIf4l9M+cu0PdQv3fp29N/27E7AXropKtOOR00=";
      };
    };
  });
  meta = {
    description = "Graphical frontend for interacting with the controller manager.";
  };
})
