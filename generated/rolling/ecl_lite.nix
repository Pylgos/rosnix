{
  ament_cmake_ros,
  buildRosPackage,
  ecl_config,
  ecl_converters_lite,
  ecl_errors,
  ecl_io,
  ecl_sigslots_lite,
  ecl_time_lite,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_lite = substituteSource {
      src = fetchgit {
        name = "ecl_lite-source";
        url = "https://github.com/ros2-gbp/ecl_lite-release.git";
        rev = "32517df9b8b7170701c2fc0f81fb8b26c03a98f1";
        hash = "sha256-pfGGGa3tTMW+9VEsHT0ofv7mnz478eGmJA10PjrEvJI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_lite";
  version = "1.2.0-4";
  src = sources.ecl_lite;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_config ecl_converters_lite ecl_errors ecl_io ecl_sigslots_lite ecl_time_lite ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Libraries and utilities for embedded and low-level linux development.";
  };
}
