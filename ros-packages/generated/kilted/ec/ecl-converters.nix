{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  ecl-build,
  ecl-concepts,
  ecl-config,
  ecl-errors,
  ecl-exceptions,
  ecl-license,
  ecl-mpl,
  ecl-type-traits,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ecl_converters";
  version = "1.2.1-5";
  src = finalAttrs.passthru.sources."ecl_converters";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ecl-build ecl-concepts ecl-config ecl-errors ecl-exceptions ecl-license ecl-mpl ecl-type-traits ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ecl-build ecl-concepts ecl-config ecl-errors ecl-exceptions ecl-license ecl-mpl ecl-type-traits ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ecl_converters" = substituteSource {
      src = fetchgit {
        name = "ecl_converters-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "83217ca890dfd7e51f324000ce8fd238e6fb3bad";
        hash = "sha256-hZthKv3t/fhEc7ubch+5EneflAc54IyTtCuBW4vzaF0=";
      };
    };
  });
  meta = {
    description = "\n     Some fast/convenient type converters, mostly for char strings or strings.\n     These are not really fully fleshed out, alot of them could use the addition for\n     the whole range of fundamental types (e.g. all integers, not just int, unsigned int).\n\n     They will come as the need arises.\n  ";
  };
})
