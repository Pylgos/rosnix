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
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    kobuki_core-ce29c096e4ed537b5d05fb85ab22a9ad2620cb3e = substituteSource {
      src = fetchgit {
        name = "kobuki_core-ce29c096e4ed537b5d05fb85ab22a9ad2620cb3e-source";
        url = "https://github.com/ros2-gbp/kobuki_core-release.git";
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
  src = sources.kobuki_core-ce29c096e4ed537b5d05fb85ab22a9ad2620cb3e;
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
