{
  ament-cmake,
  ament-cmake-gtest,
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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "easynav_simple_planner";
  version = "0.3.1-1";
  src = finalAttrs.passthru.sources."easynav_simple_planner";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ easynav-common easynav-core easynav-simple-common nav-msgs pluginlib ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ easynav-common easynav-core easynav-simple-common nav-msgs pluginlib ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "easynav_simple_planner" = substituteSource {
      src = fetchgit {
        name = "easynav_simple_planner-source";
        url = "https://github.com/EasyNavigation/easynav_plugins-release.git";
        rev = "1283b990aed3275665cc4eeeac2ceb83cc4d5437";
        hash = "sha256-hpNlbgJMn43fVPOQhIgiQfzOUR+qPHyPj+lCO4XQESc=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: Simple planner package.";
  };
})
