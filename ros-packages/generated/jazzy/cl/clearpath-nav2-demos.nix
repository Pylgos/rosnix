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
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."clearpath_nav2_demos";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ clearpath-config nav2-bringup slam-toolbox ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_nav2_demos" = substituteSource {
      src = fetchgit {
        name = "clearpath_nav2_demos-source";
        url = "https://github.com/clearpath-gbp/clearpath_nav2_demos-release.git";
        rev = "31b18efd271942359b2afaf4c7199b7c3f73e116";
        hash = "sha256-HCSIlyqPaKezQI4/d9H79hUEM9xedKjpht2xy+rVPCg=";
      };
    };
  });
  meta = {
    description = "Nav2 demos for Clearpath robots";
  };
})
