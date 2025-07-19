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
  version = "1.0.3-5";
  src = finalAttrs.passthru.sources."ecl_tools";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ecl-build ecl-license ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ecl-build ecl-license ];
  passthru.sources = mkSourceSet (sources: {
    "ecl_tools" = substituteSource {
      src = fetchgit {
        name = "ecl_tools-source";
        url = "https://github.com/ros2-gbp/ecl_tools-release.git";
        rev = "3f2def5a145961e183b0ad458d98059ca13be7f5";
        hash = "sha256-z/lKRKqVLxiSJ9nSnQyQh/Dsk/+USiDw68+Nfg9Fc0U=";
      };
    };
  });
  meta = {
    description = "\n    Tools and utilities for ecl development.\n  ";
  };
})
