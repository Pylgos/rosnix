{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  ecl-build,
  ecl-config,
  ecl-license,
  ecl-threads,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ecl_sigslots";
  version = "1.2.1-4";
  src = finalAttrs.passthru.sources."ecl_sigslots";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ecl-build ecl-config ecl-license ecl-threads ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ecl-build ecl-config ecl-license ecl-threads ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ecl_sigslots" = substituteSource {
      src = fetchgit {
        name = "ecl_sigslots-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "bf1c66ab1688b4bf9d7051d232c5142eceb2d7fa";
        hash = "sha256-c5lvTwI1CTmfeMKJsCuyr/ilN2KWeABt+RYdAxB9cdI=";
      };
    };
  });
  meta = {
    description = "\n     Provides a signal/slot mechanism (in the same vein as qt sigslots,\n     boost::signals etc for intra-process communication. These include\n     some improvements - they do not need a preprocessor, are fully type safe,\n     allow for simple connections via a posix style string identifier\n     and are multithread-safe.\n  ";
  };
})
