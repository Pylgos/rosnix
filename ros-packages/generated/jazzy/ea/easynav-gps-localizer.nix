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
  version = "0.2.1-2";
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
        rev = "2cd4782558b8ebeb9f0d921f0377022b34dc05bc";
        hash = "sha256-bahM8srMiO9pkPd+3uAM2oF+mmPN4URgL2X8iH5kN90=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: GPS Localizer package.";
  };
})
