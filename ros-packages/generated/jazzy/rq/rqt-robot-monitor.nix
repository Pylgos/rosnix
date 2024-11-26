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
  version = "1.0.6-1";
  src = finalAttrs.passthru.sources."rqt_robot_monitor";
  nativeBuildInputs = [ rosidl-default-generators wrapRosQtAppsHook ];
  propagatedBuildInputs = [ diagnostic-msgs python-qt-binding qt-gui qt-gui-py-common rclpy rqt-gui rqt-gui-py rqt-py-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-rospkg-modules" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "rqt_robot_monitor" = substituteSource {
        src = fetchgit {
          name = "rqt_robot_monitor-source";
          url = "https://github.com/ros2-gbp/rqt_robot_monitor-release.git";
          rev = "1841f5ee767e52b37a7884478766445acad7b0a5";
          hash = "sha256-8SFE5pix0PTYkcufr7ovmE/HYmjWyGUdT073Kolmm4I=";
        };
      };
    });
  };
  meta = {
    description = "rqt_robot_monitor displays diagnostics_agg topics messages that are published by";
  };
})
