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
  version = "2.9.0-1";
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
        rev = "bd4e5328bad119fdd59822e0812ed8ec8da4137e";
        hash = "sha256-yZQWR3SAsQSXC3d/wTyGmTyaKuqf2V/+3FmHlyqHzGI=";
      };
    };
  });
  meta = {
    description = "Clearpath Simulator Metapackage";
  };
})
