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
  version = "1.0.3-5";
  src = finalAttrs.passthru.sources."ecl_build";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ecl-license ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ecl-license ];
  passthru.sources = mkSourceSet (sources: {
    "ecl_build" = substituteSource {
      src = fetchgit {
        name = "ecl_build-source";
        url = "https://github.com/ros2-gbp/ecl_tools-release.git";
        rev = "2d80d378046a0cf3385b0caccd97089656545be2";
        hash = "sha256-ttmcSFmWhB7bERQkup3ucja+EU9tIc4Sb4cVetuSS00=";
      };
    };
  });
  meta = {
    description = "\n     Collection of cmake/make build tools primarily for ecl development itself, but also\n     contains a few cmake modules useful outside of the ecl.\n  ";
  };
})
