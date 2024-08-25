{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  python3Packages,
  rclpy,
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
  sources = rec {
    rqt_bag_plugins = substituteSource {
      src = fetchgit {
        name = "rqt_bag_plugins-source";
        url = "https://github.com/ros2-gbp/rqt_bag-release.git";
        rev = "692f9dfaae890f15fab4e0c5bf2f38cd10d2ffb4";
        hash = "sha256-HYDA8epYBRYiphjEhCdwFpWSlI9RuUTOHaaICu0mXJI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_bag_plugins";
  version = "1.5.3-1";
  src = sources.rqt_bag_plugins;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs python3Packages.pillow python3Packages.pycairo rclpy rosbag2 rqt_bag rqt_gui rqt_gui_py rqt_plot sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "rqt_bag provides a GUI plugin for displaying and replaying ROS bag files.";
  };
}
