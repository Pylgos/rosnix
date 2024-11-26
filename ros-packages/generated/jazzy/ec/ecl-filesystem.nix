{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  ecl-build,
  ecl-config,
  ecl-errors,
  ecl-license,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ecl_filesystem";
  version = "1.2.1-5";
  src = finalAttrs.passthru.sources."ecl_filesystem";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ecl-build ecl-config ecl-errors ecl-license ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ecl_filesystem" = substituteSource {
        src = fetchgit {
          name = "ecl_filesystem-source";
          url = "https://github.com/ros2-gbp/ecl_core-release.git";
          rev = "f05b4974145c3bf020724e07908c1d00e621c44c";
          hash = "sha256-b9AmUCVBFQ84JFx0ER/eD+2NF6JP/zybtNFnzKAI+dg=";
        };
      };
    });
  };
  meta = {
    description = "Cross platform filesystem utilities (until c++11 makes its way in).";
  };
})
