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
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."clearpath_customization";
  nativeBuildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_customization" = substituteSource {
      src = fetchgit {
        name = "clearpath_customization-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "52f5b6da4b250d0c8f589bf35b07fd6c3bf22d1f";
        hash = "sha256-OrA2/kOuiwK80kycweS2zouaT1Bcm8WKULiBouAmFF4=";
      };
    };
  });
  meta = {
    description = "Clearpath customization packages.";
  };
})
