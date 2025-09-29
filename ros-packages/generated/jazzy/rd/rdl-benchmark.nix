{
  ament-cmake,
  ament-cmake-clang-format,
  ament-cmake-cppcheck,
  ament-cmake-gtest,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-lint,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rdl-dynamics,
  rdl-urdfreader,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rdl_benchmark";
  version = "6.0.0-1";
  src = finalAttrs.passthru.sources."rdl_benchmark";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rdl-dynamics rdl-urdfreader ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rdl-dynamics rdl-urdfreader ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  checkInputs = [ ament-cmake-clang-format ament-cmake-cppcheck ament-cmake-gtest ament-cmake-lint-cmake ament-cmake-xmllint ament-lint ];
  passthru.sources = mkSourceSet (sources: {
    "rdl_benchmark" = substituteSource {
      src = fetchgit {
        name = "rdl_benchmark-source";
        url = "https://github.com/jlack1987/rdl-release.git";
        rev = "96041a8445d83d523f00fb9d78dc2e028c3e0408";
        hash = "sha256-MU3ZvHBrZCBYWHPQHDkkO7Y3QMj0JJDWzpTy/4oa/2I=";
      };
    };
  });
  meta = {
    description = "The rdl_benchmark package";
  };
})
