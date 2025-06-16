{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcl-interfaces,
  rclcpp,
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
  version = "2.0.7-1";
  src = finalAttrs.passthru.sources."swri_console";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ rcl-interfaces rclcpp rosbag2-storage-mcap rosbag2-transport rosidl-default-runtime ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-thread-dev" "libqt5-core" "libqt5-gui" "libqt5-opengl-dev" "libqt5-widgets" ]; };
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rcl-interfaces rclcpp rosbag2-storage-mcap rosbag2-transport rosidl-default-runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-thread-dev" "libqt5-core" "libqt5-gui" "libqt5-opengl-dev" "libqt5-widgets" ]; };
  passthru.sources = mkSourceSet (sources: {
    "swri_console" = substituteSource {
      src = fetchgit {
        name = "swri_console-source";
        url = "https://github.com/ros2-gbp/swri_console-release.git";
        rev = "01c98c037b5aee61eee7cd20782928e96bdf9cff";
        hash = "sha256-L1qtYv4ii0u8isEtp1RFIQojw3wT++qp4XFHDIEHRAs=";
      };
    };
  });
  meta = {
    description = "\n\n     A rosout GUI viewer developed at Southwest Research Institute as an\n     alternative to rqt_console.\n\n  ";
  };
})
