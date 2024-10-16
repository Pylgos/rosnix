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
let
  sources = mkSourceSet (sources: {
    "ecl_converters" = substituteSource {
      src = fetchgit {
        name = "ecl_converters-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "2afba0633775bff93778d25664c02fdb1b7f82c5";
        hash = "sha256-hZthKv3t/fhEc7ubch+5EneflAc54IyTtCuBW4vzaF0=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "ecl_converters";
  version = "1.2.1-5";
  src = finalAttrs.passthru.sources."ecl_converters";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ecl-build ecl-concepts ecl-config ecl-errors ecl-exceptions ecl-license ecl-mpl ecl-type-traits ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Some fast/convenient type converters, mostly for char strings or strings. These are not really fully fleshed out, alot of them could use the addition for the whole range of fundamental types (e.g. all integers, not just int, unsigned int). They will come as the need arises.";
  };
})
