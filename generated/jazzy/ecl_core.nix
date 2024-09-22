{
  ament_cmake_ros,
  buildRosPackage,
  ecl_command_line,
  ecl_concepts,
  ecl_containers,
  ecl_converters,
  ecl_core_apps,
  ecl_devices,
  ecl_eigen,
  ecl_exceptions,
  ecl_formatters,
  ecl_geometry,
  ecl_ipc,
  ecl_linear_algebra,
  ecl_math,
  ecl_mpl,
  ecl_sigslots,
  ecl_statistics,
  ecl_streams,
  ecl_threads,
  ecl_time,
  ecl_type_traits,
  ecl_utilities,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ecl_core = substituteSource {
      src = fetchFromGitHub {
        name = "ecl_core-source";
        owner = "ros2-gbp";
        repo = "ecl_core-release";
        rev = "46da871000a3a83679269de8f8c116e49f5403a0";
        hash = "sha256-/qmRsU0lb8R70sW/g5572zrbdGlRSBu3BL+GhX77UII=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_core";
  version = "1.2.1-5";
  src = sources.ecl_core;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ecl_command_line ecl_concepts ecl_containers ecl_converters ecl_core_apps ecl_devices ecl_eigen ecl_exceptions ecl_formatters ecl_geometry ecl_ipc ecl_linear_algebra ecl_math ecl_mpl ecl_sigslots ecl_statistics ecl_streams ecl_threads ecl_time ecl_type_traits ecl_utilities ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A set of tools and interfaces extending the capabilities of c++ to provide a lightweight, consistent interface with a focus for control programming.";
  };
}
