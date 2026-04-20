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
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "git" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-test ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "foonathan_memory_vendor" = substituteSource {
      src = fetchgit {
        name = "foonathan_memory_vendor-source";
        url = "https://github.com/ros2-gbp/foonathan_memory_vendor-release.git";
        rev = "446ac182791f3c0ab3817f3b503c38954e6a0133";
        hash = "sha256-LmTgr8JI5jo23rCSvEeq6WSeCvLx/dmYpqtNx0hZ7lE=";
      };
    };
  });
  meta = {
    description = "Foonathan/memory vendor package for Fast-RTPS.";
  };
})
