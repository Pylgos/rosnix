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
  mkSourceSet,
  python-qt-binding,
  rclpy,
  rosSystemPackages,
  rosbag2-py,
  rosidl-runtime-py,
  rqt-gui,
  rqt-gui-py,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_bag";
  version = "2.1.1-1";
  src = finalAttrs.passthru.sources."rqt_bag";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-python builtin-interfaces python-qt-binding rclpy rosbag2-py rosidl-runtime-py rqt-gui rqt-gui-py ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  propagatedBuildInputs = [ ament-index-python builtin-interfaces python-qt-binding rclpy rosbag2-py rosidl-runtime-py rqt-gui rqt-gui-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_bag" = substituteSource {
      src = fetchgit {
        name = "rqt_bag-source";
        url = "https://github.com/ros2-gbp/rqt_bag-release.git";
        rev = "2af2d9eca59668bdb9d55f8ce18ba8b9e50cd63f";
        hash = "sha256-1Ml4yK+1LQmytYWsRl9EPy92ouZVMOH398WxKdOig24=";
      };
    };
  });
  meta = {
    description = "rqt_bag provides a GUI plugin for displaying and replaying ROS bag files.";
  };
})
