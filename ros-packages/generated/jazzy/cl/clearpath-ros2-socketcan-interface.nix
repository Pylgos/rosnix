{
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  can-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_ros2_socketcan_interface";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."clearpath_ros2_socketcan_interface";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ can-msgs rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "iproute2" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_ros2_socketcan_interface" = substituteSource {
      src = fetchgit {
        name = "clearpath_ros2_socketcan_interface-source";
        url = "https://github.com/clearpath-gbp/clearpath_ros2_socketcan_interface-release.git";
        rev = "efd6fdad48c4b1c6f37a1a09b2838cc21c6594e3";
        hash = "sha256-os4JvHgJTP3YxuZnZIXVAgQYrTFXTEKpCb4l13HtSJo=";
      };
    };
  });
  meta = {
    description = "A ROS 2 socketcan interface.";
  };
})
