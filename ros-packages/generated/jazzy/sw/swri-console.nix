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
  version = "2.1.2-2";
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
        rev = "445846b5cf65c6242db34bacbf17fa55ffa9499e";
        hash = "sha256-6tN0i6CS9wp2un8QhHt1xv3qdi9l5Q0h/4g8xA84MWc=";
      };
    };
  });
  meta = {
    description = "\n\n     A rosout GUI viewer developed at Southwest Research Institute as an\n     alternative to rqt_console.\n\n  ";
  };
})
