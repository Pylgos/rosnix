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
  version = "0.2.1-2";
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
        rev = "64e1a2c849bff22a23ae25772ee026ed2827e43a";
        hash = "sha256-ZfPM5v56KYiRf7idgzYPAlXb5PrK0CeWpNlflc/cVYA=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: Simple planner package.";
  };
})
