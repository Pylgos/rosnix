{
  ament_cmake_ros,
  buildRosPackage,
  ecl_build,
  ecl_command_line,
  ecl_config,
  ecl_containers,
  ecl_converters,
  ecl_devices,
  ecl_errors,
  ecl_exceptions,
  ecl_formatters,
  ecl_geometry,
  ecl_ipc,
  ecl_license,
  ecl_linear_algebra,
  ecl_sigslots,
  ecl_streams,
  ecl_threads,
  ecl_time_lite,
  ecl_type_traits,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ecl_core_apps-227a5819e1b551c2ea941998b477d83e739d2007 = substituteSource {
      src = fetchgit {
        name = "ecl_core_apps-227a5819e1b551c2ea941998b477d83e739d2007-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "227a5819e1b551c2ea941998b477d83e739d2007";
        hash = "sha256-s2Ebyn5n1kiUIFSZ3pa4Ycrcv+Zxp6fh/XBk2xxjWbI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_core_apps";
  version = "1.2.1-4";
  src = sources.ecl_core_apps-227a5819e1b551c2ea941998b477d83e739d2007;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ecl_build ecl_command_line ecl_config ecl_containers ecl_converters ecl_devices ecl_errors ecl_exceptions ecl_formatters ecl_geometry ecl_ipc ecl_license ecl_linear_algebra ecl_sigslots ecl_streams ecl_threads ecl_time_lite ecl_type_traits ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "This includes a suite of programs demo'ing various aspects of the ecl_core. It also includes various benchmarking and utility programs for use primarily with embedded systems.";
  };
}
