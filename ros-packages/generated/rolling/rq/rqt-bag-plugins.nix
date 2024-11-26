{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  rosbag2,
  rqt-bag,
  rqt-gui,
  rqt-gui-py,
  rqt-plot,
  sensor-msgs,
  std-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_bag_plugins";
  version = "2.0.1-1";
  src = finalAttrs.passthru.sources."rqt_bag_plugins";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedBuildInputs = [ geometry-msgs rclpy rosbag2 rqt-bag rqt-gui rqt-gui-py rqt-plot sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-cairo" "python3-pil" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_bag_plugins" = substituteSource {
      src = fetchgit {
        name = "rqt_bag_plugins-source";
        url = "https://github.com/ros2-gbp/rqt_bag-release.git";
        rev = "9da7128d4b26ac23be829f67d016e445ab792d70";
        hash = "sha256-VDKiCc3tiy/NWeFIrj4apdUfdGqy0qpYGJkC9jxO6LE=";
      };
    };
  });
  meta = {
    description = "rqt_bag provides a GUI plugin for displaying and replaying ROS bag files.";
  };
})
