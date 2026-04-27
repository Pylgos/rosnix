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
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_controller_manager";
  version = "6.7.0-1";
  src = finalAttrs.passthru.sources."rqt_controller_manager";
  propagatedNativeBuildInputs = [ controller-manager controller-manager-msgs rclpy rqt-gui rqt-gui-py ];
  propagatedBuildInputs = [ controller-manager controller-manager-msgs rclpy rqt-gui rqt-gui-py ];
  passthru.sources = mkSourceSet (sources: {
    "rqt_controller_manager" = substituteSource {
      src = fetchgit {
        name = "rqt_controller_manager-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "d8420f30e26c71dbeb0693bd3efd4dc6bd71e68c";
        hash = "sha256-9NikDK1LdYlcumA6QVCMf277gjAOVUczLtcpP1bqo3I=";
      };
    };
  });
  meta = {
    description = "Graphical frontend for interacting with the controller manager.";
  };
})
