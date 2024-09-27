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
    rmf_battery-ddc66e4bb0a4cbac3cb8ca9ab9f582d926f7c010 = substituteSource {
      src = fetchgit {
        name = "rmf_battery-ddc66e4bb0a4cbac3cb8ca9ab9f582d926f7c010-source";
        url = "https://github.com/ros2-gbp/rmf_battery-release.git";
        rev = "ddc66e4bb0a4cbac3cb8ca9ab9f582d926f7c010";
        hash = "sha256-WIXozbzHKKM/cuaQ/TCIvi3ErLMNIqkBRHSECO1zhSE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_battery";
  version = "0.4.0-1";
  src = sources.rmf_battery-ddc66e4bb0a4cbac3cb8ca9ab9f582d926f7c010;
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
