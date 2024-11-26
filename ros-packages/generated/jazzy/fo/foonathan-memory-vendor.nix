{
  ament-cmake-copyright,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-cmake-xmllint,
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "foonathan_memory_vendor";
  version = "1.3.1-3";
  src = finalAttrs.passthru.sources."foonathan_memory_vendor";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-test ament-cmake-xmllint ];
  passthru = {
    sources = mkSourceSet (sources: {
      "foonathan_memory_vendor" = substituteSource {
        src = fetchgit {
          name = "foonathan_memory_vendor-source";
          url = "https://github.com/ros2-gbp/foonathan_memory_vendor-release.git";
          rev = "446ac182791f3c0ab3817f3b503c38954e6a0133";
          hash = "sha256-LmTgr8JI5jo23rCSvEeq6WSeCvLx/dmYpqtNx0hZ7lE=";
        };
        substitutions = [
          {
            path = "CMakeLists.txt";
            from = "GIT_REPOSITORY https://github.com/foonathan/memory.git";
            to = "URL ${sources."foonathan_memory_vendor/memory"}";
          }
        ];
      };
      "foonathan_memory_vendor/memory" = substituteSource {
        src = fetchgit {
          name = "memory-source";
          url = "https://github.com/foonathan/memory.git";
          rev = "0f0775770fd1c506fa9c5ad566bd6ba59659db66";
          hash = "sha256-nLBnxPbPKiLCFF2TJgD/eJKJJfzktVBW3SRW2m3WK/s=";
        };
      };
    });
  };
  meta = {
    description = "Foonathan/memory vendor package for Fast-RTPS.";
  };
})
