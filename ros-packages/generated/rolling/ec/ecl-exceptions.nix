{
  ament-cmake-ros,
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
  pname = "ecl_exceptions";
  version = "1.2.1-4";
  src = finalAttrs.passthru.sources."ecl_exceptions";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ecl-build ecl-config ecl-errors ecl-license ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ecl-build ecl-config ecl-errors ecl-license ];
  passthru.sources = mkSourceSet (sources: {
    "ecl_exceptions" = substituteSource {
      src = fetchgit {
        name = "ecl_exceptions-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "c2e1b001308c0850a1ebef1502fac2f31e269791";
        hash = "sha256-vSUx0IaohNthgxC/EHPPCyDY6YrVAcZUT4u5L099eA4=";
      };
    };
  });
  meta = {
    description = "\n     Template based exceptions - these are simple and practical\n     and avoid the proliferation of exception types. Although not\n     syntatactically ideal, it is convenient and eminently practical.\n  ";
  };
})
