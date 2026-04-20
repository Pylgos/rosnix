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
  version = "0.2.1-2";
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
        rev = "c34d0ee2021e64f63fdeaa9f6a13bf9156e4db1d";
        hash = "sha256-jhNhlhu7BhnquFJ3q0O6Sjh1AAEHW/QrtJ1NkDuF70I=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: Routes MapsManager package.";
  };
})
