{
  ament_cmake_catch2,
  ament_cmake_uncrustify,
  buildRosPackage,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  rmf_traffic,
  rmf_utils,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    rmf_battery-12aba542679f2d9abdf111b1162a48d531ad6eae = substituteSource {
      src = fetchgit {
        name = "rmf_battery-12aba542679f2d9abdf111b1162a48d531ad6eae-source";
        url = "https://github.com/ros2-gbp/rmf_battery-release.git";
        rev = "12aba542679f2d9abdf111b1162a48d531ad6eae";
        hash = "sha256-hxlFgpVq/Yv8gGoDRvDd4tkZQGZokoEQ/8oSL17YTlU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_battery";
  version = "0.3.1-1";
  src = sources.rmf_battery-12aba542679f2d9abdf111b1162a48d531ad6eae;
  nativeBuildInputs = [ eigen3_cmake_module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rmf_traffic rmf_utils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_catch2 ament_cmake_uncrustify ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Package for modelling battery life of robots";
  };
}
