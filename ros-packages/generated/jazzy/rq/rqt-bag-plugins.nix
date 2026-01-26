{
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
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_bag_plugins";
  version = "1.5.6-1";
  src = finalAttrs.passthru.sources."rqt_bag_plugins";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rclpy rosbag2 rqt-bag rqt-gui rqt-gui-py rqt-plot sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-cairo" "python3-numpy" "python3-pil" ]; };
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rclpy rosbag2 rqt-bag rqt-gui rqt-gui-py rqt-plot sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-cairo" "python3-numpy" "python3-pil" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_bag_plugins" = substituteSource {
      src = fetchgit {
        name = "rqt_bag_plugins-source";
        url = "https://github.com/ros2-gbp/rqt_bag-release.git";
        rev = "248120cbf01aa8a497e621253b0cce7759120b56";
        hash = "sha256-+jLUZoJxNYDfzCe4Nm3UnxNs1epJkIorunPzvq+R/Ls=";
      };
    };
  });
  meta = {
    description = "rqt_bag provides a GUI plugin for displaying and replaying ROS bag files.";
  };
})
