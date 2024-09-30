{
  buildRosPackage,
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
let
  sources = mkSourceSet (sources: {
    "rqt_joint_trajectory_controller" = substituteSource {
      src = fetchgit {
        name = "rqt_joint_trajectory_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "ca9fceacfce72b0089f9569332f41be7bce047d5";
        hash = "sha256-WHjx7AHFEsSAXQPROHhOsI4tnNe5jhRk3V4VBbRJ1bU=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rqt_joint_trajectory_controller";
  version = "4.14.0-1";
  src = sources."rqt_joint_trajectory_controller";
  nativeBuildInputs = [ wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-rospkg" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ control-msgs controller-manager-msgs python-qt-binding qt-gui rclpy rqt-gui rqt-gui-py trajectory-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Graphical frontend for interacting with joint_trajectory_controller instances.";
  };
}
