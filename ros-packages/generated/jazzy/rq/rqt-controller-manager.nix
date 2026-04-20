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
  version = "4.44.0-1";
  src = finalAttrs.passthru.sources."rqt_controller_manager";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ controller-manager controller-manager-msgs rclpy rqt-gui rqt-gui-py ];
  propagatedBuildInputs = [ controller-manager controller-manager-msgs rclpy rqt-gui rqt-gui-py ];
  passthru.sources = mkSourceSet (sources: {
    "rqt_controller_manager" = substituteSource {
      src = fetchgit {
        name = "rqt_controller_manager-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "dcc12a3ace1ee3027318838fc6f45d7df8ab4e72";
        hash = "sha256-JsEP+nG1WNoK6UUIYo1+Tg7HUYVgLvWx6zM73kn6gRE=";
      };
    };
  });
  meta = {
    description = "Graphical frontend for interacting with the controller manager.";
  };
})
