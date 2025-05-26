{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  camera-info-manager,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  mkSourceSet,
  rcl-interfaces,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "image_publisher";
  version = "5.0.11-1";
  src = finalAttrs.passthru.sources."image_publisher";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ camera-info-manager cv-bridge image-transport rcl-interfaces rclcpp rclcpp-components ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ camera-info-manager cv-bridge image-transport rcl-interfaces rclcpp rclcpp-components ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "image_publisher" = substituteSource {
      src = fetchgit {
        name = "image_publisher-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "8bcb7275b9e6df60236f4b5d235e854fe80c4b1d";
        hash = "sha256-Awcwl9iaK7bgc2SeQdh5M8/3/gfj5U1nJghr1t5t80s=";
      };
    };
  });
  meta = {
    description = "\n\n      Contains a node publish an image stream from single image file\n      or avi motion file.\n\n  ";
  };
})
