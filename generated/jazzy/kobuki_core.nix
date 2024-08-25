{
  ament_cmake_ros,
  buildRosPackage,
  ecl_build,
  ecl_command_line,
  ecl_config,
  ecl_console,
  ecl_converters,
  ecl_devices,
  ecl_geometry,
  ecl_mobile_robot,
  ecl_sigslots,
  ecl_threads,
  ecl_time,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    kobuki_core = substituteSource {
      src = fetchgit {
        name = "kobuki_core-source";
        url = "https://github.com/ros2-gbp/kobuki_core-release.git";
        rev = "00876e81a32953ec6b09b474c2f8e82289245f75";
        hash = "sha256-Bq/+5lnLAiJ2HQtIr0h6wB08J7OxRxT4YhcLHIrCUwI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kobuki_core";
  version = "1.4.0-4";
  src = sources.kobuki_core;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_command_line ecl_config ecl_console ecl_converters ecl_devices ecl_geometry ecl_mobile_robot ecl_sigslots ecl_threads ecl_time ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Pure C++ driver library for Kobuki.";
  };
}
