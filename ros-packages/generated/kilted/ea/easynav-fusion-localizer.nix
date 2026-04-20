{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  angles,
  buildAmentCmakePackage,
  easynav-common,
  easynav-core,
  easynav-localizer,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic-msgs,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  robot-localization,
  rosSystemPackages,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "easynav_fusion_localizer";
  version = "0.3.1-1";
  src = finalAttrs.passthru.sources."easynav_fusion_localizer";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ angles easynav-common easynav-core easynav-localizer geographic-msgs pluginlib rclcpp rclcpp-lifecycle robot-localization std-srvs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "geographiclib" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles easynav-common easynav-core easynav-localizer geographic-msgs pluginlib rclcpp rclcpp-lifecycle robot-localization std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "geographiclib" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common robot-localization ];
  passthru.sources = mkSourceSet (sources: {
    "easynav_fusion_localizer" = substituteSource {
      src = fetchgit {
        name = "easynav_fusion_localizer-source";
        url = "https://github.com/EasyNavigation/easynav_plugins-release.git";
        rev = "35f1b7847348adc23aa840fa3e9ee1a3ae9cf638";
        hash = "sha256-wMTHEIfkhyYWXkvTRmP28qyLs7RJ6+qphz+usuNrqXI=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: Fusion Localizer package.";
  };
})
