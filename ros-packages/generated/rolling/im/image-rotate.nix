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
  geometry-msgs,
  image-transport,
  mkSourceSet,
  rcl-interfaces,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "image_rotate";
  version = "8.0.0-1";
  src = finalAttrs.passthru.sources."image_rotate";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ class-loader cv-bridge geometry-msgs image-transport rcl-interfaces rclcpp rclcpp-components sensor-msgs tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libopencv-dev" ]; };
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ class-loader cv-bridge geometry-msgs image-transport rcl-interfaces rclcpp rclcpp-components sensor-msgs tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "image_rotate" = substituteSource {
      src = fetchgit {
        name = "image_rotate-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "13daa7c6c9a1c3e71dbca525a5ca3623e249c491";
        hash = "sha256-gJCS0JQ2XaXZHwaaM0X5tTbjDRFOJCfmyi06JzpyeI4=";
      };
    };
  });
  meta = {
    description = "\n    ";
  };
})
