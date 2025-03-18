{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  clearpath-generator-gz,
  clearpath-gz,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_simulator";
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."clearpath_simulator";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ clearpath-generator-gz clearpath-gz ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_simulator" = substituteSource {
      src = fetchgit {
        name = "clearpath_simulator-source";
        url = "https://github.com/clearpath-gbp/clearpath_simulator-release.git";
        rev = "a206673f73954479de2dd759effa0953015cfee0";
        hash = "sha256-Ngjwjc0IBJpDUr5yOHOdnNEJjC2chXorBZNhNYUImmo=";
      };
    };
  });
  meta = {
    description = "Clearpath Simulator Metapackage";
  };
})
