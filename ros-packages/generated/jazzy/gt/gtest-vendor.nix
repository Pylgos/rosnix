{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "gtest_vendor";
  version = "1.14.9000-2";
  src = finalAttrs.passthru.sources."gtest_vendor";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  passthru.sources = mkSourceSet (sources: {
    "gtest_vendor" = substituteSource {
      src = fetchgit {
        name = "gtest_vendor-source";
        url = "https://github.com/ros2-gbp/googletest-release.git";
        rev = "949478db25504854988f1510571c5b93a67f9c4b";
        hash = "sha256-hfNPBuRwt4tacGQDjHj0OfgABSsSMXo2L8rlGApqxBc=";
      };
    };
  });
  meta = {
    description = "The package provides GoogleTest.";
  };
})
