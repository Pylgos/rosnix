{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  ecl-build,
  ecl-converters,
  ecl-eigen,
  ecl-exceptions,
  ecl-formatters,
  ecl-license,
  ecl-math,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  sophus,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ecl_linear_algebra";
  version = "1.2.1-5";
  src = finalAttrs.passthru.sources."ecl_linear_algebra";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ecl-build ecl-converters ecl-eigen ecl-exceptions ecl-formatters ecl-license ecl-math sophus ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ecl-build ecl-converters ecl-eigen ecl-exceptions ecl-formatters ecl-license ecl-math sophus ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ecl_linear_algebra" = substituteSource {
      src = fetchgit {
        name = "ecl_linear_algebra-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "7ceb6675e06a0c7492bed70ce3651d79d2b74e32";
        hash = "sha256-2Mofxug8ckLfTnStaTQtx69z6SvToiY8incBV3OMXJo=";
      };
    };
  });
  meta = {
    description = "\n     Ecl frontend to a linear matrix package (currently eigen).\n  ";
  };
})
