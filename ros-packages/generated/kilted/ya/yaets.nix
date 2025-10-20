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
  version = "1.0.3-1";
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
        rev = "fbd0c88c4bc45c0a1f0073ab9358178367aed23c";
        hash = "sha256-PoDYAGFp+5ITPk3nqxrmYiVeCUSKGtq4oUUkbacKOX4=";
      };
    };
  });
  meta = {
    description = "This package provides a execution tracing library.";
  };
})
