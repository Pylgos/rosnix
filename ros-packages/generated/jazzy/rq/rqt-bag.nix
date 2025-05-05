{
  ament-copyright,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-qt-binding,
  rclpy,
  rosSystemPackages,
  rosbag2-py,
  rqt-gui,
  rqt-gui-py,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_bag";
  version = "1.5.4-1";
  src = finalAttrs.passthru.sources."rqt_bag";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ python-qt-binding rclpy rosbag2-py rqt-gui rqt-gui-py ];
  propagatedBuildInputs = [ python-qt-binding rclpy rosbag2-py rqt-gui rqt-gui-py ];
  checkInputs = [ ament-copyright ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_bag" = substituteSource {
      src = fetchgit {
        name = "rqt_bag-source";
        url = "https://github.com/ros2-gbp/rqt_bag-release.git";
        rev = "0068b7860bdd734467c025ab6fc24ed2f6c48733";
        hash = "sha256-exkgftY4mO96e/zb3UHU2Fm7yCD2xhX4F6NdaqFL52A=";
      };
    };
  });
  meta = {
    description = "rqt_bag provides a GUI plugin for displaying and replaying ROS bag files.";
  };
})
