{
  ament_copyright,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python_qt_binding,
  rclpy,
  rosSystemPackages,
  rosbag2_py,
  rqt_gui,
  rqt_gui_py,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_bag-73910e523cbb261fbdaf6550ffc2fac17f7db735 = substituteSource {
      src = fetchgit {
        name = "rqt_bag-73910e523cbb261fbdaf6550ffc2fac17f7db735-source";
        url = "https://github.com/ros2-gbp/rqt_bag-release.git";
        rev = "73910e523cbb261fbdaf6550ffc2fac17f7db735";
        hash = "sha256-t6qqtyCqhPaF9v+PG6v4Xjvj85FWEchyttw8s07Yp9w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_bag";
  version = "2.0.1-1";
  src = sources.rqt_bag-73910e523cbb261fbdaf6550ffc2fac17f7db735;
  nativeBuildInputs = [ wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ python_qt_binding rclpy rosbag2_py rqt_gui rqt_gui_py ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "rqt_bag provides a GUI plugin for displaying and replaying ROS bag files.";
  };
}
