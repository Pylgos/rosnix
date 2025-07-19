{
  ament-cmake,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rcutils,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "broll";
  version = "0.1.1-1";
  src = finalAttrs.passthru.sources."broll";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-components rcutils sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "ffmpeg" "pkg-config" ]; };
  buildInputs = [ ament-cmake ament-cmake-ros ];
  propagatedBuildInputs = [ rclcpp rclcpp-components rcutils sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "ffmpeg" "pkg-config" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "broll" = substituteSource {
      src = fetchgit {
        name = "broll-source";
        url = "https://github.com/ros2-gbp/rosbag2_broll-release.git";
        rev = "2657d7e2452cb7a120d446940bd37dad9201e224";
        hash = "sha256-KNe27XkL8QhRxF5llMy8IF0JM/R1FYvxEdbe1PQHv8w=";
      };
    };
  });
  meta = {
    description = "B-Roll utility library for interacting with video stream data in the context of rosbag2";
  };
})
