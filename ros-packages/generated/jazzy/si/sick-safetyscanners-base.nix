{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "sick_safetyscanners_base" = substituteSource {
      src = fetchgit {
        name = "sick_safetyscanners_base-source";
        url = "https://github.com/ros2-gbp/sick_safetyscanners_base-release.git";
        rev = "c99986f307aef23800b4acbaa199eb3a2c3c32ba";
        hash = "sha256-u+5zBQP6PPEewEWwTz69T2n6FkZutVJfMk+ajxccbcw=";
      };
      substitutions = [
      ];
    };
  });
in
buildCmakePackage (finalAttrs: {
  pname = "sick_safetyscanners_base";
  version = "1.0.3-1";
  src = finalAttrs.passthru.sources."sick_safetyscanners_base";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-chrono-dev" "libboost-system-dev" "libboost-thread-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Provides an Interface to read the sensor output of a SICK Safety Scanner";
  };
})
