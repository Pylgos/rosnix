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
  version = "1.16.0-1";
  src = finalAttrs.passthru.sources."gtest_vendor";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  passthru.sources = mkSourceSet (sources: {
    "gtest_vendor" = substituteSource {
      src = fetchgit {
        name = "gtest_vendor-source";
        url = "https://github.com/ros2-gbp/googletest-release.git";
        rev = "97720e9dade91271c030bd8d07d8914478b6c423";
        hash = "sha256-jNOQ4ODGtLEAvJZ8b5lSJSTEfNNrwHenME1wigJvccc=";
      };
    };
  });
  meta = {
    description = "The package provides GoogleTest.";
  };
})
