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
  version = "0.2.1-2";
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
        rev = "fa8b79bd254c1a64d8bee8405f910ae8d7c131ea";
        hash = "sha256-zSqREzMj+Xr+hiq/RlyNNbqOeTAB6nBHoMzBLTgnjVk=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: Simple MapsManager package.";
  };
})
