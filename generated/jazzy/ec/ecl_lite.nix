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
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ecl_lite-b21a43e7be198acd2a02ba5e51ee340d19675952 = substituteSource {
      src = fetchgit {
        name = "ecl_lite-b21a43e7be198acd2a02ba5e51ee340d19675952-source";
        url = "https://github.com/ros2-gbp/ecl_lite-release.git";
        rev = "b21a43e7be198acd2a02ba5e51ee340d19675952";
        hash = "sha256-pfGGGa3tTMW+9VEsHT0ofv7mnz478eGmJA10PjrEvJI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_lite";
  version = "1.2.0-5";
  src = sources.ecl_lite-b21a43e7be198acd2a02ba5e51ee340d19675952;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ecl_config ecl_converters_lite ecl_errors ecl_io ecl_sigslots_lite ecl_time_lite ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Libraries and utilities for embedded and low-level linux development.";
  };
}
