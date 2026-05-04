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
  version = "1.10.4-2";
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
        rev = "4409b2d452fa845626b346377d8c886f8b3b2c9c";
        hash = "sha256-JqX1pFBbaFzkNSAuddJIxhAxlKA4s1ftJfacoc1HwFA=";
      };
    };
  });
  meta = {
    description = "rqt_gui_cpp enables GUI plugins to use the C++ client library for ROS.";
  };
})
