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
  pname = "ecl_io";
  version = "1.2.0-5";
  src = finalAttrs.passthru.sources."ecl_io";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ecl-build ecl-config ecl-errors ecl-license ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ecl-build ecl-config ecl-errors ecl-license ];
  passthru.sources = mkSourceSet (sources: {
    "ecl_io" = substituteSource {
      src = fetchgit {
        name = "ecl_io-source";
        url = "https://github.com/ros2-gbp/ecl_lite-release.git";
        rev = "6fd3d3a19fded7329f94a9de19905dacb088ace5";
        hash = "sha256-I434FhFkRvH1CxPDYASTtfmyT/mK0OLoVA+VPEiSa24=";
      };
    };
  });
  meta = {
    description = "\n     Most implementations (windows, posix, ...) have slightly different api for\n     low level input-output functions. These are gathered here and re-represented\n     with a cross platform set of functions.\n  ";
  };
})
