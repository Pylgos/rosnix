{
  buildRosPackage,
  controller_manager,
  controller_manager_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  rclpy,
  rosSystemPackages,
  rqt_gui,
  rqt_gui_py,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_controller_manager-65205255829e721bb04747207330981e1f21fa34 = substituteSource {
      src = fetchgit {
        name = "rqt_controller_manager-65205255829e721bb04747207330981e1f21fa34-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "65205255829e721bb04747207330981e1f21fa34";
        hash = "sha256-zM0LHoxUiFkE1Owsi+iBguEht67wUJp2UPMGl1teLm4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_controller_manager";
  version = "4.17.0-1";
  src = sources.rqt_controller_manager-65205255829e721bb04747207330981e1f21fa34;
  nativeBuildInputs = [ wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ controller_manager controller_manager_msgs rclpy rqt_gui rqt_gui_py ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Graphical frontend for interacting with the controller manager.";
  };
}
