{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_customization";
  version = "2.0.2-1";
  src = finalAttrs.passthru.sources."clearpath_customization";
  nativeBuildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_customization" = substituteSource {
      src = fetchgit {
        name = "clearpath_customization-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "577c2a637dfa4f79264eeaa32cce00a6fb98eb94";
        hash = "sha256-wuIgG1cApMFOUGD3r+p5jWcr2yGN/AewF5svuZ+YDLM=";
      };
    };
  });
  meta = {
    description = "Clearpath customization packages.";
  };
})
