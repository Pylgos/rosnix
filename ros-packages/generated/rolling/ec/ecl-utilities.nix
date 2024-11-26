{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  ecl-build,
  ecl-concepts,
  ecl-license,
  ecl-mpl,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ecl_utilities";
  version = "1.2.1-4";
  src = finalAttrs.passthru.sources."ecl_utilities";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ecl-build ecl-concepts ecl-license ecl-mpl ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ecl_utilities" = substituteSource {
        src = fetchgit {
          name = "ecl_utilities-source";
          url = "https://github.com/ros2-gbp/ecl_core-release.git";
          rev = "db3973b3cbdd6aa51da4b02d2a91b66b605650e1";
          hash = "sha256-lr/gRtkjgtYbXIMwa5OUbaSehxs5kKRTATWgZooFnRA=";
        };
      };
    });
  };
  meta = {
    description = "Includes various supporting tools and utilities for c++ programming.";
  };
})
