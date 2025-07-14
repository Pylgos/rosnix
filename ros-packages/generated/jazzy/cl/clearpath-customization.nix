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
  version = "2.6.1-1";
  src = finalAttrs.passthru.sources."clearpath_customization";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_customization" = substituteSource {
      src = fetchgit {
        name = "clearpath_customization-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "721b4774533473fd428a54fbb9d845ad3683bbc5";
        hash = "sha256-Lfz2PMql57KcQP5uoXcwXNoWs9vE/xmYgElwlQX8dxg=";
      };
    };
  });
  meta = {
    description = "Clearpath customization packages.";
  };
})
