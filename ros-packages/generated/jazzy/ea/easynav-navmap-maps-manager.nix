{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  easynav-common,
  easynav-core,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nav-msgs,
  navmap-core,
  navmap-ros,
  navmap-ros-interfaces,
  pluginlib,
  rosSystemPackages,
  sensor-msgs,
  std-srvs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
  yaets,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "easynav_navmap_maps_manager";
  version = "0.2.1-2";
  src = finalAttrs.passthru.sources."easynav_navmap_maps_manager";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp easynav-common easynav-core nav-msgs navmap-core navmap-ros navmap-ros-interfaces pluginlib sensor-msgs std-srvs tf2 tf2-geometry-msgs tf2-ros yaets yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "graphicsmagick" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp easynav-common easynav-core nav-msgs navmap-core navmap-ros navmap-ros-interfaces pluginlib sensor-msgs std-srvs tf2 tf2-geometry-msgs tf2-ros yaets yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "graphicsmagick" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "easynav_navmap_maps_manager" = substituteSource {
      src = fetchgit {
        name = "easynav_navmap_maps_manager-source";
        url = "https://github.com/EasyNavigation/easynav_plugins-release.git";
        rev = "e681460356a63ea0e4c61aae2c0ac32e6fe00eb5";
        hash = "sha256-7+vBdRU1NH3qKen3IcUkLitlBc1Il0/qboDf6A0/c9o=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: Simple MapsManager package.";
  };
})
