{
  buildAmentPythonPackage,
  diagnostic-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-qt-binding,
  qt-gui,
  qt-gui-py-common,
  rclpy,
  rosSystemPackages,
  rosidl-default-generators,
  rqt-gui,
  rqt-gui-py,
  rqt-py-common,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_robot_monitor";
  version = "1.0.6-2";
  src = finalAttrs.passthru.sources."rqt_robot_monitor";
  nativeBuildInputs = [ rosidl-default-generators wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ diagnostic-msgs python-qt-binding qt-gui qt-gui-py-common rclpy rqt-gui rqt-gui-py rqt-py-common ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-rospkg-modules" ]; };
  buildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ diagnostic-msgs python-qt-binding qt-gui qt-gui-py-common rclpy rqt-gui rqt-gui-py rqt-py-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-rospkg-modules" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_robot_monitor" = substituteSource {
      src = fetchgit {
        name = "rqt_robot_monitor-source";
        url = "https://github.com/ros2-gbp/rqt_robot_monitor-release.git";
        rev = "d8247f03de3753a11e32982eeccc7e6d3dc51f9e";
        hash = "sha256-8SFE5pix0PTYkcufr7ovmE/HYmjWyGUdT073Kolmm4I=";
      };
    };
  });
  meta = {
    description = "rqt_robot_monitor displays diagnostics_agg topics messages that\n   are published by ";
  };
})
