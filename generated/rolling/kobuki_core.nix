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
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    kobuki_core = substituteSource {
      src = fetchFromGitHub {
        name = "kobuki_core-source";
        owner = "ros2-gbp";
        repo = "kobuki_core-release";
        rev = "ce29c096e4ed537b5d05fb85ab22a9ad2620cb3e";
        hash = "sha256-Bq/+5lnLAiJ2HQtIr0h6wB08J7OxRxT4YhcLHIrCUwI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kobuki_core";
  version = "1.4.0-3";
  src = sources.kobuki_core;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ecl_build ecl_command_line ecl_config ecl_console ecl_converters ecl_devices ecl_geometry ecl_mobile_robot ecl_sigslots ecl_threads ecl_time ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Pure C++ driver library for Kobuki.";
  };
}
