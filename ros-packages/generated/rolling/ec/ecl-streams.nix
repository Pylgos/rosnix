{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  ecl-build,
  ecl-concepts,
  ecl-converters,
  ecl-devices,
  ecl-errors,
  ecl-license,
  ecl-time,
  ecl-type-traits,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ecl_streams";
  version = "1.2.1-4";
  src = finalAttrs.passthru.sources."ecl_streams";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ecl-build ecl-concepts ecl-converters ecl-devices ecl-errors ecl-license ecl-time ecl-type-traits ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ecl_streams" = substituteSource {
      src = fetchgit {
        name = "ecl_streams-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "9526a2f86060c201b2866ad2f0dd380cda29cf59";
        hash = "sha256-IpgY894/j+PnAx+KIYX8Wvb7yve2eAvnuYrKq0ZgX0s=";
      };
    };
  });
  meta = {
    description = "These are lightweight text streaming classes that connect to standardised ecl type devices.";
  };
})
