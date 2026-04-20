{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  easynav-bonxai-maps-manager,
  easynav-common,
  easynav-core,
  easynav-localizer,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  navmap-core,
  navmap-ros,
  navmap-ros-interfaces,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  std-srvs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "easynav_navmap_localizer";
  version = "0.3.1-1";
  src = finalAttrs.passthru.sources."easynav_navmap_localizer";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ easynav-bonxai-maps-manager easynav-common easynav-core easynav-localizer geometry-msgs nav-msgs navmap-core navmap-ros navmap-ros-interfaces pluginlib tf2 tf2-geometry-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ easynav-bonxai-maps-manager easynav-common easynav-core easynav-localizer geometry-msgs nav-msgs navmap-core navmap-ros navmap-ros-interfaces pluginlib tf2 tf2-geometry-msgs tf2-ros ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common rclcpp rclcpp-lifecycle std-srvs ];
  passthru.sources = mkSourceSet (sources: {
    "easynav_navmap_localizer" = substituteSource {
      src = fetchgit {
        name = "easynav_navmap_localizer-source";
        url = "https://github.com/EasyNavigation/easynav_plugins-release.git";
        rev = "26e7f2ac7010cc5bf162fd20f6589e2023c0dd8d";
        hash = "sha256-/ieQGrcKnXXePc89W8I8g1eBKagiV7SkmAVmxmhbW4I=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: nAVmAP Localizer package.";
  };
})
