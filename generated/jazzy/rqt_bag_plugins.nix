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
        rev = "611ec8d4d363d887f64260ce376ddce1f586137e";
        hash = "sha256-PlJfh+9GTcXBnMWt/FkDemyryrX4N2GwiEQrKimfSNs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_bag_plugins";
  version = "1.5.4-1";
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
