{
  ament-cmake-ros,
  buildAmentCmakePackage,
  ecl-config,
  ecl-converters-lite,
  ecl-errors,
  ecl-io,
  ecl-sigslots-lite,
  ecl-time-lite,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ecl_lite";
  version = "1.2.0-5";
  src = finalAttrs.passthru.sources."ecl_lite";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ecl-config ecl-converters-lite ecl-errors ecl-io ecl-sigslots-lite ecl-time-lite ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ecl-config ecl-converters-lite ecl-errors ecl-io ecl-sigslots-lite ecl-time-lite ];
  passthru.sources = mkSourceSet (sources: {
    "ecl_lite" = substituteSource {
      src = fetchgit {
        name = "ecl_lite-source";
        url = "https://github.com/ros2-gbp/ecl_lite-release.git";
        rev = "8457fcb19fa39b3024bae59dc4d5dad117c5598e";
        hash = "sha256-pfGGGa3tTMW+9VEsHT0ofv7mnz478eGmJA10PjrEvJI=";
      };
    };
  });
  meta = {
    description = "\n    Libraries and utilities for embedded and low-level linux development.\n  ";
  };
})
