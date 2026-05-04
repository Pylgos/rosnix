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
  version = "1.16.1-2";
  src = finalAttrs.passthru.sources."gtest_vendor";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  passthru.sources = mkSourceSet (sources: {
    "gtest_vendor" = substituteSource {
      src = fetchgit {
        name = "gtest_vendor-source";
        url = "https://github.com/ros2-gbp/googletest-release.git";
        rev = "dfc7ac5c8fa2dd51b71d6f5d293b1ed0eea0b523";
        hash = "sha256-a2NNlpVglWN9CT7LZ4Q97EfyQpIFnNL1HQU2/C74s54=";
      };
    };
  });
  meta = {
    description = "The package provides GoogleTest.";
  };
})
