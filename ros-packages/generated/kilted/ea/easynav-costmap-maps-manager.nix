{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  easynav-common,
  easynav-core,
  easynav-costmap-common,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nav-msgs,
  pluginlib,
  rosSystemPackages,
  std-srvs,
  substituteSource,
  tf2-ros,
  yaets,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "easynav_costmap_maps_manager";
  version = "0.3.1-1";
  src = finalAttrs.passthru.sources."easynav_costmap_maps_manager";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp easynav-common easynav-core easynav-costmap-common nav-msgs pluginlib std-srvs tf2-ros yaets yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "graphicsmagick" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp easynav-common easynav-core easynav-costmap-common nav-msgs pluginlib std-srvs tf2-ros yaets yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "graphicsmagick" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "easynav_costmap_maps_manager" = substituteSource {
      src = fetchgit {
        name = "easynav_costmap_maps_manager-source";
        url = "https://github.com/EasyNavigation/easynav_plugins-release.git";
        rev = "813a2f05cc44028b46e7bb3b37b361425700ae7c";
        hash = "sha256-ZH7YnKU+ea9zGaNXXlsBRLKwMF8CBOoiervXGZkbrl0=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: Simple MapsManager package.";
  };
})
