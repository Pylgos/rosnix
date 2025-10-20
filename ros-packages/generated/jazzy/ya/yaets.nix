{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-cmake-module,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "yaets";
  version = "1.0.4-1";
  src = finalAttrs.passthru.sources."yaets";
  nativeBuildInputs = [ python-cmake-module ];
  propagatedNativeBuildInputs = [ ament-cmake ];
  buildInputs = [ python-cmake-module ];
  propagatedBuildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "yaets" = substituteSource {
      src = fetchgit {
        name = "yaets-source";
        url = "https://github.com/fmrico/yaets-release.git";
        rev = "1d76b8a24c2c0176b53c0906a229fc9402e8c135";
        hash = "sha256-7xD1MjQP0Yh2K1a+/m35/yGYIA8BNzRBXPXBlyEWK48=";
      };
    };
  });
  meta = {
    description = "This package provides a execution tracing library.";
  };
})
