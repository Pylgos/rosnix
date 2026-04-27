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
  version = "2.9.1-1";
  src = finalAttrs.passthru.sources."clearpath_simulator";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ clearpath-generator-gz clearpath-gz ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ clearpath-generator-gz clearpath-gz ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_simulator" = substituteSource {
      src = fetchgit {
        name = "clearpath_simulator-source";
        url = "https://github.com/clearpath-gbp/clearpath_simulator-release.git";
        rev = "c35e2274edee0104d9cb8a4c07d6ea919294611c";
        hash = "sha256-9+SpvoImKkx1jaE2g1FlnY67jyy822SmbiqmMWuScNE=";
      };
    };
  });
  meta = {
    description = "Clearpath Simulator Metapackage";
  };
})
