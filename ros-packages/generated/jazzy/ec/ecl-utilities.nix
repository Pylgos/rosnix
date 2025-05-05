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
  version = "1.2.1-5";
  src = finalAttrs.passthru.sources."ecl_utilities";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ecl-build ecl-concepts ecl-license ecl-mpl ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ecl-build ecl-concepts ecl-license ecl-mpl ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ecl_utilities" = substituteSource {
      src = fetchgit {
        name = "ecl_utilities-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "b5d6924f855d8ab70a7d59415fbed2d89ed6cd38";
        hash = "sha256-lr/gRtkjgtYbXIMwa5OUbaSehxs5kKRTATWgZooFnRA=";
      };
    };
  });
  meta = {
    description = "\n     Includes various supporting tools and utilities for c++ programming.\n  ";
  };
})
