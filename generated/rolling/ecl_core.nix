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
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ecl_core = substituteSource {
      src = fetchgit {
        name = "ecl_core-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "261e45bfe3c586f0d4be406fa40e4594eca4f5a5";
        hash = "sha256-/qmRsU0lb8R70sW/g5572zrbdGlRSBu3BL+GhX77UII=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_core";
  version = "1.2.1-4";
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
