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
  version = "6.0.8-1";
  src = finalAttrs.passthru.sources."image_publisher";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ camera-info-manager cv-bridge image-transport rcl-interfaces rclcpp rclcpp-components ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "image_publisher" = substituteSource {
      src = fetchgit {
        name = "image_publisher-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "c7d6584d5156e4fe177c86f0ba640c3f2c315d21";
        hash = "sha256-OgfGhVrA5nIzJF4/EqtKqjyuG38NA0LmRWcWusXYnmE=";
      };
    };
  });
  meta = {
    description = "Contains a node publish an image stream from single image file or avi motion file.";
  };
})
