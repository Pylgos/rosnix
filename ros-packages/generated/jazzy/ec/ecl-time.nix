{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  ecl-build,
  ecl-config,
  ecl-errors,
  ecl-exceptions,
  ecl-license,
  ecl-time-lite,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "ecl_time" = substituteSource {
      src = fetchgit {
        name = "ecl_time-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "737c5377306d2ab352553b7abac2e223d197c918";
        hash = "sha256-SC1B6uuNMjWdHD10L5nXdVvgkguZSiwRc1i/zONxu5E=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage (finalAttrs: {
  pname = "ecl_time";
  version = "1.2.1-5";
  src = finalAttrs.passthru.sources."ecl_time";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ecl-build ecl-config ecl-errors ecl-exceptions ecl-license ecl-time-lite ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Timing utilities are very dependent on the system api provided for their use. This package provides a means for handling different timing models. Current support - posix rt : complete. - macosx : posix timers only, missing absolute timers. - win : none.";
  };
})
