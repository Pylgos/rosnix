{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-qt-binding,
  rclpy,
  rosSystemPackages,
  rosidl-default-generators,
  rqt-gui,
  rqt-gui-py,
  rqt-py-common,
  rqt-topic,
  sensor-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_moveit";
  version = "1.0.1-5";
  src = finalAttrs.passthru.sources."rqt_moveit";
  nativeBuildInputs = [ rosidl-default-generators wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-setuptools" ]; };
  propagatedBuildInputs = [ python-qt-binding rclpy rqt-gui rqt-gui-py rqt-py-common rqt-topic sensor-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rqt_moveit" = substituteSource {
      src = fetchgit {
        name = "rqt_moveit-source";
        url = "https://github.com/ros2-gbp/rqt_moveit-release.git";
        rev = "907f5687d674b3f68e5590c2d0d08eddac25ec41";
        hash = "sha256-A4bGoHfpokKaYjSrBzvtYgzyf6sJGECfPJCIM0iZgYU=";
      };
    };
  });
  meta = {
    description = "An rqt-based tool that assists monitoring tasks for";
  };
})
