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
  version = "6.7.0-2";
  src = finalAttrs.passthru.sources."rqt_controller_manager";
  propagatedNativeBuildInputs = [ controller-manager controller-manager-msgs rclpy rqt-gui rqt-gui-py ];
  propagatedBuildInputs = [ controller-manager controller-manager-msgs rclpy rqt-gui rqt-gui-py ];
  passthru.sources = mkSourceSet (sources: {
    "rqt_controller_manager" = substituteSource {
      src = fetchgit {
        name = "rqt_controller_manager-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "1951b9e3bda74ba4e7ca778bc74647b1c7c18781";
        hash = "sha256-9NikDK1LdYlcumA6QVCMf277gjAOVUczLtcpP1bqo3I=";
      };
    };
  });
  meta = {
    description = "Graphical frontend for interacting with the controller manager.";
  };
})
