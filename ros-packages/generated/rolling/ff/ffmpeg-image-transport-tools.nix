{
  ament-cmake,
  ament-cmake-clang-format,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  ffmpeg-image-transport,
  ffmpeg-image-transport-msgs,
  mkSourceSet,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  rosbag2-cpp,
  rosbag2-storage,
  sensor-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "ffmpeg_image_transport_tools" = substituteSource {
      src = fetchgit {
        name = "ffmpeg_image_transport_tools-source";
        url = "https://github.com/ros2-gbp/ffmpeg_image_transport_tools-release.git";
        rev = "979862f31a931e214c647e2c9ab38757d99807dd";
        hash = "sha256-swXtnWDcYMHi4NZTdTTgmdmj5yWFc7cyTm/393iJ1aA=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "ffmpeg_image_transport_tools";
  version = "1.0.1-1";
  src = finalAttrs.passthru.sources."ffmpeg_image_transport_tools";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv-bridge ffmpeg-image-transport ffmpeg-image-transport-msgs rclcpp rosbag2-cpp rosbag2-storage sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-clang-format ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "tools for processing ffmpeg_image_transport_msgs";
  };
})
