{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  ecl-build,
  ecl-license,
  ecl-type-traits,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ecl_math";
  version = "1.2.1-4";
  src = finalAttrs.passthru.sources."ecl_math";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ecl-build ecl-license ecl-type-traits ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ecl_math" = substituteSource {
      src = fetchgit {
        name = "ecl_math-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "4ff20015db01acaf2b366358d93b2f42da48e406";
        hash = "sha256-FJevrMf2MxF+heenjke0paV5yAvePcxmHcEW7Is+Pmc=";
      };
    };
  });
  meta = {
    description = "This package provides simple support to cmath, filling in holes or redefining in a c++ formulation where desirable.";
  };
})
