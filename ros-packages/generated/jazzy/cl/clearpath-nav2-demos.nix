{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  clearpath-config,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nav2-bringup,
  rosSystemPackages,
  slam-toolbox,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_nav2_demos";
  version = "2.5.0-1";
  src = finalAttrs.passthru.sources."clearpath_nav2_demos";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ clearpath-config nav2-bringup slam-toolbox ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ clearpath-config nav2-bringup slam-toolbox ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_nav2_demos" = substituteSource {
      src = fetchgit {
        name = "clearpath_nav2_demos-source";
        url = "https://github.com/clearpath-gbp/clearpath_nav2_demos-release.git";
        rev = "a798262a4a70f6f41acd78a93d38ed9611d08a2e";
        hash = "sha256-8zMqUQsf9pCXh7fYr6gfMX3J24STk/bvK3W791WkBWI=";
      };
    };
  });
  meta = {
    description = "Nav2 demos for Clearpath robots";
  };
})
