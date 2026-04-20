{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  easynav-common,
  easynav-core,
  easynav-localizer,
  easynav-simple-common,
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
  pname = "easynav_simple_localizer";
  version = "0.2.1-2";
  src = finalAttrs.passthru.sources."easynav_simple_localizer";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ easynav-common easynav-core easynav-localizer easynav-simple-common geometry-msgs nav-msgs pluginlib tf2 tf2-geometry-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ easynav-common easynav-core easynav-localizer easynav-simple-common geometry-msgs nav-msgs pluginlib tf2 tf2-geometry-msgs tf2-ros ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common rclcpp rclcpp-lifecycle std-srvs ];
  passthru.sources = mkSourceSet (sources: {
    "easynav_simple_localizer" = substituteSource {
      src = fetchgit {
        name = "easynav_simple_localizer-source";
        url = "https://github.com/EasyNavigation/easynav_plugins-release.git";
        rev = "747ad159a93542c0e9e86a336fad3c2d81302347";
        hash = "sha256-jHjRfBau8l+/Aw65zb/XTT8WNKf2EErznERwqXkAnTQ=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: Simple Localizer package.";
  };
})
