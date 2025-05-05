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
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."rqt_image_overlay_layer";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp rcpputils ];
  propagatedBuildInputs = [ message-filters pluginlib rosidl-runtime-cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qtbase5-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rqt_image_overlay_layer" = substituteSource {
      src = fetchgit {
        name = "rqt_image_overlay_layer-source";
        url = "https://github.com/ros2-gbp/rqt_image_overlay-release.git";
        rev = "57714d97548f7c9dacee0f3599a0b914ea7c1823";
        hash = "sha256-/0HaJFLVN/yUJvAE9JU6R53Nhv5QA/72rUweZfeT1uc=";
      };
    };
  });
  meta = {
    description = "Provides an rqt_image_overlay_layer plugin interface, and a template impelementation class";
  };
})
