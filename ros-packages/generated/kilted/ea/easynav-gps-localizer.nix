{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  easynav-common,
  easynav-core,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic-msgs,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "easynav_gps_localizer";
  version = "0.3.1-1";
  src = finalAttrs.passthru.sources."easynav_gps_localizer";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ easynav-common easynav-core geographic-msgs pluginlib rclcpp rclcpp-lifecycle ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "geographiclib" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ easynav-common easynav-core geographic-msgs pluginlib rclcpp rclcpp-lifecycle ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "geographiclib" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "easynav_gps_localizer" = substituteSource {
      src = fetchgit {
        name = "easynav_gps_localizer-source";
        url = "https://github.com/EasyNavigation/easynav_plugins-release.git";
        rev = "dbb79746268e041b2630db03bf6fcec052f2e85a";
        hash = "sha256-dDdEjwU0OySOY6NPC6ez26q0UgIEZMEafh4QZ3Eb0eQ=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: GPS Localizer package.";
  };
})
