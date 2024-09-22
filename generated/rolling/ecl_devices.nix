{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ecl_build,
  ecl_config,
  ecl_containers,
  ecl_errors,
  ecl_license,
  ecl_mpl,
  ecl_threads,
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
    ecl_devices = substituteSource {
      src = fetchFromGitHub {
        name = "ecl_devices-source";
        owner = "ros2-gbp";
        repo = "ecl_core-release";
        rev = "067078139b70a895cd6de9ad582ab8734e39ccb9";
        hash = "sha256-fdhKBuF9q7x8XDG5ld90RQRXHhZf4I6pJGU5KK6EOeI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_devices";
  version = "1.2.1-4";
  src = sources.ecl_devices;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ecl_build ecl_config ecl_containers ecl_errors ecl_license ecl_mpl ecl_threads ecl_type_traits ecl_utilities ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Provides an extensible and standardised framework for input-output devices.";
  };
}
