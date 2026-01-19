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
  version = "2.8.0-1";
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
        rev = "543a52afa66caea85566ac9c25a12cedafd054f1";
        hash = "sha256-0XH5ClPxKFzFO8mc9sTfUk4WSM4F+Vsr26+Ruw1+Ebc=";
      };
    };
  });
  meta = {
    description = "Nav2 demos for Clearpath robots";
  };
})
