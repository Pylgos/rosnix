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
  version = "0.2.1-2";
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
        rev = "06189c081fc6789e61ac701eaf3f533f590eb779";
        hash = "sha256-sS8yok1k0YEUggLtYV7uST6LKXATINtQPmIzKmLXaTw=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: Fusion Localizer package.";
  };
})
