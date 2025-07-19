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
  version = "1.0.3-2";
  src = finalAttrs.passthru.sources."sick_safetyscanners_base";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-chrono-dev" "libboost-system-dev" "libboost-thread-dev" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libboost-chrono-dev" "libboost-system-dev" "libboost-thread-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "sick_safetyscanners_base" = substituteSource {
      src = fetchgit {
        name = "sick_safetyscanners_base-source";
        url = "https://github.com/ros2-gbp/sick_safetyscanners_base-release.git";
        rev = "912f1f6adb08484ac053ed1645e5e8355cbcb150";
        hash = "sha256-u+5zBQP6PPEewEWwTz69T2n6FkZutVJfMk+ajxccbcw=";
      };
    };
  });
  meta = {
    description = "Provides an Interface to read the sensor output of a SICK\n  Safety Scanner";
  };
})
