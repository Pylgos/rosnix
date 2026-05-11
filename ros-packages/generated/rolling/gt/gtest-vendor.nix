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
  version = "1.17.0-2";
  src = finalAttrs.passthru.sources."gtest_vendor";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  passthru.sources = mkSourceSet (sources: {
    "gtest_vendor" = substituteSource {
      src = fetchgit {
        name = "gtest_vendor-source";
        url = "https://github.com/ros2-gbp/googletest-release.git";
        rev = "b06217c0b34c2d4c372ecabeaf2e810b7debc574";
        hash = "sha256-Ori3mdTWk/j07qTWdtdQ/HCevK8Bqhmz71nH2WjM1WY=";
      };
    };
  });
  meta = {
    description = "The package provides GoogleTest.";
  };
})
