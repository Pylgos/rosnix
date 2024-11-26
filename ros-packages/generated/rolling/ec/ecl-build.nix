{
  ament-cmake,
  buildAmentCmakePackage,
  ecl-license,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ecl_build";
  version = "1.0.3-4";
  src = finalAttrs.passthru.sources."ecl_build";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ecl-license ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ecl_build" = substituteSource {
        src = fetchgit {
          name = "ecl_build-source";
          url = "https://github.com/ros2-gbp/ecl_tools-release.git";
          rev = "fc70f1b1c5cf842334208f73a41fbf56d910eacb";
          hash = "sha256-ttmcSFmWhB7bERQkup3ucja+EU9tIc4Sb4cVetuSS00=";
        };
      };
    });
  };
  meta = {
    description = "Collection of cmake/make build tools primarily for ecl development itself, but also contains a few cmake modules useful outside of the ecl.";
  };
})
