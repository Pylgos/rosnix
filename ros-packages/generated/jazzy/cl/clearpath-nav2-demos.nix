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
  version = "2.7.1-1";
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
        rev = "e0740b8f9ac5e20e51b911bf0e12243576fb74d7";
        hash = "sha256-6+I2E+Cq5i6bY3j3BqydBYOFjd12GUnNOPNxW4ShUls=";
      };
    };
  });
  meta = {
    description = "Nav2 demos for Clearpath robots";
  };
})
