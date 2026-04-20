{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  easynav-common,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nav-msgs,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "easynav_costmap_common";
  version = "0.2.1-2";
  src = finalAttrs.passthru.sources."easynav_costmap_common";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp easynav-common nav-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp easynav-common nav-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "easynav_costmap_common" = substituteSource {
      src = fetchgit {
        name = "easynav_costmap_common-source";
        url = "https://github.com/EasyNavigation/easynav_plugins-release.git";
        rev = "a39dd2ebc87e83acf733fadea1a37d3415f28d3a";
        hash = "sha256-EvFPhUMcuRHYTzOWKcX7RGDG5oFCALa4fATytFzM4oc=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: Simple Common package.";
  };
})
