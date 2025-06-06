{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  camera-calibration-parsers,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  message-filters,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  std-srvs,
  stereo-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "image_view";
  version = "5.0.11-1";
  src = finalAttrs.passthru.sources."image_view";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ camera-calibration-parsers cv-bridge image-transport message-filters rclcpp rclcpp-components rclpy sensor-msgs std-srvs stereo-msgs ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ camera-calibration-parsers cv-bridge image-transport message-filters rclcpp rclcpp-components rclpy sensor-msgs std-srvs stereo-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "image_view" = substituteSource {
      src = fetchgit {
        name = "image_view-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "0e2d2e84d5075db4098b5257f0e4cc3a9e375f05";
        hash = "sha256-7GLLP2TeOd3gXG2La6bKWMB0imV+UokQ/qpP+I95pqo=";
      };
    };
  });
  meta = {
    description = "\n  A simple viewer for ROS image topics. Includes a specialized viewer\n  for stereo + disparity images.\n  ";
  };
})
