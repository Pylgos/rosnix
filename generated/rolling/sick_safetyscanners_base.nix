{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    sick_safetyscanners_base = substituteSource {
      src = fetchgit {
        name = "sick_safetyscanners_base-source";
        url = "https://github.com/ros2-gbp/sick_safetyscanners_base-release.git";
        rev = "6a6f6ce0aa9ba42f12369fa934bb606b6f1136b2";
        hash = "sha256-u+5zBQP6PPEewEWwTz69T2n6FkZutVJfMk+ajxccbcw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sick_safetyscanners_base";
  version = "1.0.3-1";
  src = sources.sick_safetyscanners_base;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-chrono-dev" "libboost-system-dev" "libboost-thread-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Provides an Interface to read the sensor output of a SICK Safety Scanner";
  };
}
