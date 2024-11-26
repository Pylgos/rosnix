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
  version = "1.15.0-1";
  src = finalAttrs.passthru.sources."gtest_vendor";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "gtest_vendor" = substituteSource {
        src = fetchgit {
          name = "gtest_vendor-source";
          url = "https://github.com/ros2-gbp/googletest-release.git";
          rev = "76baff7823620c1c36ed5464b28bfd8c9b52d081";
          hash = "sha256-Zg30M2S4KqWNrzQZyuVcTjvY7oCPPsWbnfMQ+fvV768=";
        };
      };
    });
  };
  meta = {
    description = "The package provides GoogleTest.";
  };
})
