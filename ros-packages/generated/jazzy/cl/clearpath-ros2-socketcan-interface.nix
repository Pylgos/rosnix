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
  version = "2.1.1-2";
  src = finalAttrs.passthru.sources."clearpath_ros2_socketcan_interface";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ can-msgs rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "iproute2" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_ros2_socketcan_interface" = substituteSource {
      src = fetchgit {
        name = "clearpath_ros2_socketcan_interface-source";
        url = "https://github.com/clearpath-gbp/clearpath_ros2_socketcan_interface-release.git";
        rev = "802e652d590b9ced257c3b939bc346d8002d2340";
        hash = "sha256-VnpXy5ko/MCYyOupTcws2/1yhX4OZctqqobUtiC29Aw=";
      };
    };
  });
  meta = {
    description = "A ROS 2 socketcan interface.";
  };
})
