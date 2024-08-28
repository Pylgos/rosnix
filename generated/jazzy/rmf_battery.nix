{
  ament_cmake_catch2,
  ament_cmake_uncrustify,
  buildRosPackage,
  cmake,
  eigen,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  rmf_traffic,
  rmf_utils,
  substituteSource,
}:
let
  sources = rec {
    rmf_battery = substituteSource {
      src = fetchgit {
        name = "rmf_battery-source";
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
  src = sources.rmf_battery;
  nativeBuildInputs = [ cmake eigen3_cmake_module ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen rmf_traffic rmf_utils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_catch2 ament_cmake_uncrustify ];
  missingDependencies = [  ];
  meta = {
    description = "Package for modelling battery life of robots";
  };
}
