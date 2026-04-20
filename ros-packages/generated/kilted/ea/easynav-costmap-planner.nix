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
  version = "0.3.1-1";
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
        rev = "492403cda669c31acf90a26b9e360d47e75e151f";
        hash = "sha256-wsRPcXdk1M9/7qy+DmEfd/i8FIAWcuN4PnfLbf4vET4=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: Costmap planner package.";
  };
})
