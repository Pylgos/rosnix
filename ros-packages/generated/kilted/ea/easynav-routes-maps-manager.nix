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
  geometry-msgs,
  interactive-markers,
  mkSourceSet,
  nav-msgs,
  pluginlib,
  rosSystemPackages,
  std-srvs,
  substituteSource,
  tf2-ros,
  visualization-msgs,
  yaets,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "easynav_routes_maps_manager";
  version = "0.3.1-1";
  src = finalAttrs.passthru.sources."easynav_routes_maps_manager";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp easynav-common easynav-core easynav-costmap-common geometry-msgs interactive-markers nav-msgs pluginlib std-srvs tf2-ros visualization-msgs yaets ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "yaml-cpp" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp easynav-common easynav-core easynav-costmap-common geometry-msgs interactive-markers nav-msgs pluginlib std-srvs tf2-ros visualization-msgs yaets ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "yaml-cpp" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "easynav_routes_maps_manager" = substituteSource {
      src = fetchgit {
        name = "easynav_routes_maps_manager-source";
        url = "https://github.com/EasyNavigation/easynav_plugins-release.git";
        rev = "189b9b792a74d5a14d1ccfcbac925b2ade920ecf";
        hash = "sha256-gOTu/diGvJmjai65gInDay8z2xTe2TakuJ9IqsCQurY=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: Routes MapsManager package.";
  };
})
