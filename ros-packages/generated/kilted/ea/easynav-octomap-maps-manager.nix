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
  octomap-msgs,
  octomap-ros,
  pcl-conversions,
  pcl-ros,
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
  pname = "easynav_octomap_maps_manager";
  version = "0.3.1-1";
  src = finalAttrs.passthru.sources."easynav_octomap_maps_manager";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp easynav-common easynav-core nav-msgs octomap-msgs octomap-ros pcl-conversions pcl-ros pluginlib sensor-msgs std-srvs tf2 tf2-geometry-msgs tf2-ros yaets yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "graphicsmagick" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp easynav-common easynav-core nav-msgs octomap-msgs octomap-ros pcl-conversions pcl-ros pluginlib sensor-msgs std-srvs tf2 tf2-geometry-msgs tf2-ros yaets yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "graphicsmagick" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "easynav_octomap_maps_manager" = substituteSource {
      src = fetchgit {
        name = "easynav_octomap_maps_manager-source";
        url = "https://github.com/EasyNavigation/easynav_plugins-release.git";
        rev = "54972f8eb359fac653eb1a78d5b6a2f19232b06f";
        hash = "sha256-vVmiEvuBFcxNlxi3sCOXmZ4yOcPoiS1LCv4baReIfn8=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: Simple MapsManager package.";
  };
})
