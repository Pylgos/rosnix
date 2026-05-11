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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rqt_gui_cpp";
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."rqt_gui_cpp";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ pluginlib qt-gui-cpp rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "qt-base-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pluginlib qt-gui-cpp rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qt-base-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rqt_gui_cpp" = substituteSource {
      src = fetchgit {
        name = "rqt_gui_cpp-source";
        url = "https://github.com/ros2-gbp/rqt-release.git";
        rev = "11de134e2ac76e8bf3dc835d1e78fec76cff9c7d";
        hash = "sha256-eOx6l/IXBmUw/pIfRPHslClFEDIPKbay+TQFwmJ7uc8=";
      };
    };
  });
  meta = {
    description = "rqt_gui_cpp enables GUI plugins to use the C++ client library for ROS.";
  };
})
