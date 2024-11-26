{
  ament-cmake-ros,
  buildAmentCmakePackage,
  ecl-build,
  ecl-config,
  ecl-license,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ecl_console";
  version = "1.2.0-5";
  src = finalAttrs.passthru.sources."ecl_console";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ecl-build ecl-config ecl-license ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ecl_console" = substituteSource {
        src = fetchgit {
          name = "ecl_console-source";
          url = "https://github.com/ros2-gbp/ecl_lite-release.git";
          rev = "8ae020da4280c2a5035e07302d4bb15e2e59a78b";
          hash = "sha256-w1XZlDsjZDQ0MPDG+dhU0mD3KZjRt4yslxJCP5RHeTE=";
        };
      };
    });
  };
  meta = {
    description = "Color codes for ansii consoles.";
  };
})
