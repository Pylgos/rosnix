{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  qt-gui-cpp,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rqt_gui_cpp";
  version = "1.10.1-1";
  src = finalAttrs.passthru.sources."rqt_gui_cpp";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ pluginlib qt-gui-cpp rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pluginlib qt-gui-cpp rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qtbase5-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rqt_gui_cpp" = substituteSource {
      src = fetchgit {
        name = "rqt_gui_cpp-source";
        url = "https://github.com/ros2-gbp/rqt-release.git";
        rev = "85a7db1f12120b1f78294340424a6cc96273033e";
        hash = "sha256-YTCVh3KqReEz1RgTqj/qWpHHDbbkZBH7Uugwv52o3Vk=";
      };
    };
  });
  meta = {
    description = "rqt_gui_cpp enables GUI plugins to use the C++ client library for ROS.";
  };
})
