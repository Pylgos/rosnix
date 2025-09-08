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
  version = "7.1.1-1";
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
        rev = "28d7e9f894d8e31f8b368c1a1de19650f041bd1b";
        hash = "sha256-0OExesulV87G0RnBj7lCgGSJF9+SwMyg1PDAGmwKmy8=";
      };
    };
  });
  meta = {
    description = "\n\n      Contains a node publish an image stream from single image file\n      or avi motion file.\n\n  ";
  };
})
