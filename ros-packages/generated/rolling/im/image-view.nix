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
  version = "6.0.5-1";
  src = finalAttrs.passthru.sources."image_view";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ camera-calibration-parsers cv-bridge image-transport message-filters rclcpp rclcpp-components rclpy sensor-msgs std-srvs stereo-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "image_view" = substituteSource {
        src = fetchgit {
          name = "image_view-source";
          url = "https://github.com/ros2-gbp/image_pipeline-release.git";
          rev = "6eef952ed6f80b7dd5e5c746c4909113ccdfa259";
          hash = "sha256-wlu21j95dApSWAwfVmV9LEdMU1trLamAPx5HeMS/RoQ=";
        };
      };
    });
  };
  meta = {
    description = "A simple viewer for ROS image topics. Includes a specialized viewer for stereo + disparity images.";
  };
})
