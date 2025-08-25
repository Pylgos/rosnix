{
  ament-cmake,
  ament-index-cpp,
  buildAmentCmakePackage,
  clips-vendor,
  cx-plugin,
  cx-utils,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  rosSystemPackages,
  substituteSource,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cx_config_plugin";
  version = "0.1.3-1";
  src = finalAttrs.passthru.sources."cx_config_plugin";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp clips-vendor cx-plugin cx-utils pluginlib yaml-cpp-vendor ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp clips-vendor cx-plugin cx-utils pluginlib yaml-cpp-vendor ];
  passthru.sources = mkSourceSet (sources: {
    "cx_config_plugin" = substituteSource {
      src = fetchgit {
        name = "cx_config_plugin-source";
        url = "https://github.com/ros2-gbp/clips_executive-release.git";
        rev = "fd6aac9ff6eb3706ead9a67a95929d2bd38d8897";
        hash = "sha256-Obs3l9UdNras82PaiQVQQ0qelo53f+geCpJ1/d8tz94=";
      };
    };
  });
  meta = {
    description = "CX plugin to parse yaml files and provide the values to CLIPS";
  };
})
