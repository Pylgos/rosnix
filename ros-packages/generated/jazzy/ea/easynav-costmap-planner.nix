{
  ament-cmake,
  ament-cmake-gtest,
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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "easynav_costmap_planner";
  version = "0.2.1-2";
  src = finalAttrs.passthru.sources."easynav_costmap_planner";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ easynav-common easynav-core easynav-costmap-common nav-msgs pluginlib ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ easynav-common easynav-core easynav-costmap-common nav-msgs pluginlib ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "easynav_costmap_planner" = substituteSource {
      src = fetchgit {
        name = "easynav_costmap_planner-source";
        url = "https://github.com/EasyNavigation/easynav_plugins-release.git";
        rev = "b9745eae8e893bf772f56a5ebf49e619fff668aa";
        hash = "sha256-KjqbCwifOs58xnRF7gW9zK52X6WJlbdwnwwZMjjPj/I=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: Costmap planner package.";
  };
})
