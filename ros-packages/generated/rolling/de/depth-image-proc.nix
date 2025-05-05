{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  class-loader,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image-geometry,
  image-proc,
  image-transport,
  message-filters,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  stereo-msgs,
  substituteSource,
  tf2,
  tf2-eigen,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "depth_image_proc";
  version = "6.0.10-1";
  src = finalAttrs.passthru.sources."depth_image_proc";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ class-loader cv-bridge image-geometry image-proc image-transport message-filters rclcpp rclcpp-components sensor-msgs stereo-msgs tf2 tf2-eigen tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libopencv-dev" ]; };
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ class-loader cv-bridge image-geometry image-proc image-transport message-filters rclcpp rclcpp-components sensor-msgs stereo-msgs tf2 tf2-eigen tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "depth_image_proc" = substituteSource {
      src = fetchgit {
        name = "depth_image_proc-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "ea9c0832bb61371ab3c20d62a93bc3e927144fb9";
        hash = "sha256-+bWwLatwEb0+alHyhhXOJ1dj6yLMiH/ILRIrfKsCWUw=";
      };
    };
  });
  meta = {
    description = "\n\n     Contains components for processing depth images such as those\n     produced by OpenNI camera. Functions include creating disparity\n     images and point clouds, as well as registering (reprojecting)\n     a depth image into another camera frame.\n\n  ";
  };
})
