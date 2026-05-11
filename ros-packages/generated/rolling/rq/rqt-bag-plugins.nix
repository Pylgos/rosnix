{
  ament-copyright,
  ament-flake8,
  ament-index-python,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  builtin-interfaces,
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
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_bag_plugins";
  version = "2.3.0-1";
  src = finalAttrs.passthru.sources."rqt_bag_plugins";
  propagatedNativeBuildInputs = [ ament-index-python builtin-interfaces geometry-msgs rclpy rosbag2 rqt-bag rqt-gui rqt-gui-py rqt-plot sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-cairo" "python3-numpy" "python3-pil" ]; };
  propagatedBuildInputs = [ ament-index-python builtin-interfaces geometry-msgs rclpy rosbag2 rqt-bag rqt-gui rqt-gui-py rqt-plot sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-cairo" "python3-numpy" "python3-pil" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_bag_plugins" = substituteSource {
      src = fetchgit {
        name = "rqt_bag_plugins-source";
        url = "https://github.com/ros2-gbp/rqt_bag-release.git";
        rev = "644acc5b4c033077c01f102c5401487eba0b1149";
        hash = "sha256-Ys9zy+3PX4NwdOaikGJOXbqFwNCNrtkTzHxyMHan4pU=";
      };
    };
  });
  meta = {
    description = "rqt_bag provides a GUI plugin for displaying and replaying ROS bag files.";
  };
})
