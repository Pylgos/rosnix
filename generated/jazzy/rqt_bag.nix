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
    rqt_bag = substituteSource {
      src = fetchgit {
        name = "rqt_bag-source";
        url = "https://github.com/ros2-gbp/rqt_bag-release.git";
        rev = "0068b7860bdd734467c025ab6fc24ed2f6c48733";
        hash = "sha256-exkgftY4mO96e/zb3UHU2Fm7yCD2xhX4F6NdaqFL52A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_bag";
  version = "1.5.4-1";
  src = sources.rqt_bag;
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
