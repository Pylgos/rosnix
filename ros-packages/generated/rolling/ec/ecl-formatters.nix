{
  ament-cmake-ros,
  buildAmentCmakePackage,
  ecl-build,
  ecl-config,
  ecl-converters,
  ecl-exceptions,
  ecl-license,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ecl_formatters";
  version = "1.2.1-4";
  src = finalAttrs.passthru.sources."ecl_formatters";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ecl-build ecl-config ecl-converters ecl-exceptions ecl-license ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ecl_formatters" = substituteSource {
        src = fetchgit {
          name = "ecl_formatters-source";
          url = "https://github.com/ros2-gbp/ecl_core-release.git";
          rev = "66e2096786bed9bb97c5e5d2c8d2518a673a3790";
          hash = "sha256-KJ9Xhcl2ACKk7qJz2OTu+dVkgzMcvIBEwmXdl0NaiKg=";
        };
      };
    });
  };
  meta = {
    description = "The formatters here simply format various input types to a specified text format. They can be used with most streaming types (including both ecl and stl streams).";
  };
})
