{
  ament-cmake,
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
  pname = "ecl_tools";
  version = "1.0.3-4";
  src = finalAttrs.passthru.sources."ecl_tools";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ecl-build ecl-license ];
  passthru.sources = mkSourceSet (sources: {
    "ecl_tools" = substituteSource {
      src = fetchgit {
        name = "ecl_tools-source";
        url = "https://github.com/ros2-gbp/ecl_tools-release.git";
        rev = "becfda330d937361223823b68049732e9e01d293";
        hash = "sha256-z/lKRKqVLxiSJ9nSnQyQh/Dsk/+USiDw68+Nfg9Fc0U=";
      };
    };
  });
  meta = {
    description = "Tools and utilities for ecl development.";
  };
})
