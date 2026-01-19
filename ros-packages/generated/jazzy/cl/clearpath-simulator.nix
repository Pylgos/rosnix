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
  version = "2.7.1-1";
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
        rev = "62a3355e7fe0a66ed8c0994ef3e34eacc02924f0";
        hash = "sha256-kEdL3GsKmQVRLmLCZ0JYovquJ7uWjqoYiyfE953Uer8=";
      };
    };
  });
  meta = {
    description = "Clearpath Simulator Metapackage";
  };
})
