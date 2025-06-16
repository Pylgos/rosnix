{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcl-interfaces,
  rclcpp,
  rmw,
  rosSystemPackages,
  rosbag2-storage-mcap,
  rosbag2-transport,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "swri_console";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."swri_console";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ rcl-interfaces rclcpp rmw rosbag2-storage-mcap rosbag2-transport rosidl-default-runtime ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libqt5-core" "libqt5-gui" "libqt5-opengl-dev" "libqt5-widgets" ]; };
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rcl-interfaces rclcpp rmw rosbag2-storage-mcap rosbag2-transport rosidl-default-runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-gui" "libqt5-opengl-dev" "libqt5-widgets" ]; };
  passthru.sources = mkSourceSet (sources: {
    "swri_console" = substituteSource {
      src = fetchgit {
        name = "swri_console-source";
        url = "https://github.com/ros2-gbp/swri_console-release.git";
        rev = "2647a582e54d48b8de8c4cc57f17b60d25b86524";
        hash = "sha256-RyyHor61bbwPT/bshPflJoLMnO2R2Tq1mMTQLP5g9o4=";
      };
    };
  });
  meta = {
    description = "\n\n     A rosout GUI viewer developed at Southwest Research Institute as an\n     alternative to rqt_console.\n\n  ";
  };
})
