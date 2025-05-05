{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  message-filters,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rcpputils,
  rosSystemPackages,
  rosidl-runtime-cpp,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rqt_image_overlay_layer";
  version = "0.5.0-1";
  src = finalAttrs.passthru.sources."rqt_image_overlay_layer";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ message-filters pluginlib rclcpp rcpputils rosidl-runtime-cpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ message-filters pluginlib rclcpp rcpputils rosidl-runtime-cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qtbase5-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rqt_image_overlay_layer" = substituteSource {
      src = fetchgit {
        name = "rqt_image_overlay_layer-source";
        url = "https://github.com/ros2-gbp/rqt_image_overlay-release.git";
        rev = "478164c3016fb9153248602267a53fbb122f6367";
        hash = "sha256-4VigJN1O/ZVUe33eEVylrUuiZhq1TYWF+LS1UkIe7LI=";
      };
    };
  });
  meta = {
    description = "Provides an rqt_image_overlay_layer plugin interface, and a template impelementation class";
  };
})
