{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  ecl-build,
  ecl-config,
  ecl-containers,
  ecl-errors,
  ecl-license,
  ecl-mpl,
  ecl-threads,
  ecl-type-traits,
  ecl-utilities,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "ecl_devices" = substituteSource {
      src = fetchgit {
        name = "ecl_devices-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "067078139b70a895cd6de9ad582ab8734e39ccb9";
        hash = "sha256-fdhKBuF9q7x8XDG5ld90RQRXHhZf4I6pJGU5KK6EOeI=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ecl_devices";
  version = "1.2.1-4";
  src = sources."ecl_devices";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ecl-build ecl-config ecl-containers ecl-errors ecl-license ecl-mpl ecl-threads ecl-type-traits ecl-utilities ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Provides an extensible and standardised framework for input-output devices.";
  };
}
