{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "sick_safetyscanners_base";
  version = "1.0.3-1";
  src = finalAttrs.passthru.sources."sick_safetyscanners_base";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libboost-chrono-dev" "libboost-system-dev" "libboost-thread-dev" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "sick_safetyscanners_base" = substituteSource {
        src = fetchgit {
          name = "sick_safetyscanners_base-source";
          url = "https://github.com/ros2-gbp/sick_safetyscanners_base-release.git";
          rev = "c99986f307aef23800b4acbaa199eb3a2c3c32ba";
          hash = "sha256-u+5zBQP6PPEewEWwTz69T2n6FkZutVJfMk+ajxccbcw=";
        };
      };
    });
  };
  meta = {
    description = "Provides an Interface to read the sensor output of a SICK Safety Scanner";
  };
})
