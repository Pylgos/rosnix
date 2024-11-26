{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  ecl-build,
  ecl-license,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ecl_mpl";
  version = "1.2.1-4";
  src = finalAttrs.passthru.sources."ecl_mpl";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ecl-build ecl-license ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ecl_mpl" = substituteSource {
        src = fetchgit {
          name = "ecl_mpl-source";
          url = "https://github.com/ros2-gbp/ecl_core-release.git";
          rev = "9186cc900b97cb345537724e7118d21d3aa77c96";
          hash = "sha256-b7VJovFqbuLBco3qEl5r57uuO7wTyZrjQSNR6hNX00k=";
        };
      };
    });
  };
  meta = {
    description = "Metaprogramming tools move alot of runtime calculations to be shifted to compile time. This has only very elementary structures at this stage.";
  };
})
