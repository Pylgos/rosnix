{
  ament-copyright,
  ament-flake8,
  ament-index-python,
  ament-pep257,
  ament-xmllint,
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
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."rqt_bag_plugins";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ rclpy ];
  propagatedBuildInputs = [ ament-index-python geometry-msgs rosbag2 rqt-bag rqt-gui rqt-gui-py rqt-plot sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-cairo" "python3-pil" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_bag_plugins" = substituteSource {
      src = fetchgit {
        name = "rqt_bag_plugins-source";
        url = "https://github.com/ros2-gbp/rqt_bag-release.git";
        rev = "3df6dc0299b74539bf4eb95480aadc9874f808a6";
        hash = "sha256-gJ7sWaFhK8HmOk0XWyEDZEZf4CIeeqztQKvj0dyS70A=";
      };
    };
  });
  meta = {
    description = "rqt_bag provides a GUI plugin for displaying and replaying ROS bag files.";
  };
})
