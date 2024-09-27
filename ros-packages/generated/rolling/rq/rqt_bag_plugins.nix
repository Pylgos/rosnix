{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  rosbag2,
  rqt_bag,
  rqt_gui,
  rqt_gui_py,
  rqt_plot,
  sensor_msgs,
  std_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "rqt_bag_plugins" = substituteSource {
      src = fetchgit {
        name = "rqt_bag_plugins-source";
        url = "https://github.com/ros2-gbp/rqt_bag-release.git";
        rev = "9da7128d4b26ac23be829f67d016e445ab792d70";
        hash = "sha256-VDKiCc3tiy/NWeFIrj4apdUfdGqy0qpYGJkC9jxO6LE=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rqt_bag_plugins";
  version = "2.0.1-1";
  src = sources."rqt_bag_plugins";
  nativeBuildInputs = [ wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs rclpy rosbag2 rqt_bag rqt_gui rqt_gui_py rqt_plot sensor_msgs std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-cairo" "python3-pil" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "rqt_bag provides a GUI plugin for displaying and replaying ROS bag files.";
  };
}
