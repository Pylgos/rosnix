{
  ament_cmake,
  ament_cmake_clang_format,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  ffmpeg_image_transport,
  ffmpeg_image_transport_msgs,
  rclcpp,
  rosSystemPackages,
  ros_environment,
  rosbag2_cpp,
  rosbag2_storage,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    ffmpeg_image_transport_tools-979862f31a931e214c647e2c9ab38757d99807dd = substituteSource {
      src = fetchgit {
        name = "ffmpeg_image_transport_tools-979862f31a931e214c647e2c9ab38757d99807dd-source";
        url = "https://github.com/ros2-gbp/ffmpeg_image_transport_tools-release.git";
        rev = "979862f31a931e214c647e2c9ab38757d99807dd";
        hash = "sha256-swXtnWDcYMHi4NZTdTTgmdmj5yWFc7cyTm/393iJ1aA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ffmpeg_image_transport_tools";
  version = "1.0.1-1";
  src = sources.ffmpeg_image_transport_tools-979862f31a931e214c647e2c9ab38757d99807dd;
  nativeBuildInputs = [ ament_cmake ament_cmake_ros ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv_bridge ffmpeg_image_transport ffmpeg_image_transport_msgs rclcpp rosbag2_cpp rosbag2_storage sensor_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_clang_format ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "tools for processing ffmpeg_image_transport_msgs";
  };
}
