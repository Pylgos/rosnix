{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  easynav-common,
  easynav-core,
  easynav-costmap-common,
  easynav-localizer,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
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
  pname = "easynav_costmap_localizer";
  version = "0.2.1-2";
  src = finalAttrs.passthru.sources."easynav_costmap_localizer";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ easynav-common easynav-core easynav-costmap-common easynav-localizer geometry-msgs nav-msgs pluginlib tf2 tf2-geometry-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ easynav-common easynav-core easynav-costmap-common easynav-localizer geometry-msgs nav-msgs pluginlib tf2 tf2-geometry-msgs tf2-ros ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common rclcpp rclcpp-lifecycle std-srvs ];
  passthru.sources = mkSourceSet (sources: {
    "easynav_costmap_localizer" = substituteSource {
      src = fetchgit {
        name = "easynav_costmap_localizer-source";
        url = "https://github.com/EasyNavigation/easynav_plugins-release.git";
        rev = "1a039a7d86f81210cbac77cae6bc3fd9e63edf65";
        hash = "sha256-y7j/iNfarWcuzQ4jxgHoJHgsLLHBbwqM4fblyaFkoB0=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: Costmap Localizer package.";
  };
})
