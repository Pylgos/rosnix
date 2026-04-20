{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  easynav-common,
  easynav-core,
  easynav-simple-common,
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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "easynav_simple_maps_manager";
  version = "0.3.1-1";
  src = finalAttrs.passthru.sources."easynav_simple_maps_manager";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp easynav-common easynav-core easynav-simple-common nav-msgs pluginlib std-srvs tf2-ros yaets ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp easynav-common easynav-core easynav-simple-common nav-msgs pluginlib std-srvs tf2-ros yaets ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "easynav_simple_maps_manager" = substituteSource {
      src = fetchgit {
        name = "easynav_simple_maps_manager-source";
        url = "https://github.com/EasyNavigation/easynav_plugins-release.git";
        rev = "4f7a53ff15ed419ccc4f0a8846f29042b4967c38";
        hash = "sha256-dkROoUcQKeBSGhe7rHP/v77ngLoaeoLYNyo7Nk01zUU=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: Simple MapsManager package.";
  };
})
