{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  microstrain_inertial_msgs,
  nav_msgs,
  rclpy,
  rqt_gui,
  rqt_gui_py,
  std_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    microstrain_inertial_rqt = substituteSource {
      src = fetchgit {
        name = "microstrain_inertial_rqt-source";
        url = "https://github.com/ros2-gbp/microstrain_inertial-release.git";
        rev = "6bf54c3d71ef19c28bea5a873b658a9a1d0dd61c";
        hash = "sha256-SfEuY4PDqEWUD0/6/draATnUJY0mGH4OOeGYhdeYicA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "microstrain_inertial_rqt";
  version = "4.3.0-1";
  src = sources.microstrain_inertial_rqt;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs microstrain_inertial_msgs nav_msgs rclpy rqt_gui rqt_gui_py std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The microstrain_inertial_rqt package provides several RQT widgets to view the status of Microstrain devices";
  };
}
