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
  version = "4.22.0-1";
  src = finalAttrs.passthru.sources."rqt_controller_manager";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedBuildInputs = [ controller-manager controller-manager-msgs rclpy rqt-gui rqt-gui-py ];
  passthru.sources = mkSourceSet (sources: {
    "rqt_controller_manager" = substituteSource {
      src = fetchgit {
        name = "rqt_controller_manager-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "147be96d6ede2dcbe74515e6494903b2b1fb3d9f";
        hash = "sha256-tD8ev0reqLzJ54u7DKa6W0ddhVfYdchj18rrS/Er1Mg=";
      };
    };
  });
  meta = {
    description = "Graphical frontend for interacting with the controller manager.";
  };
})
