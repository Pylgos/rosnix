{
  ament_cmake_ros,
  buildRosPackage,
  ecl_build,
  ecl_config,
  ecl_errors,
  ecl_license,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ecl_sigslots_lite-95d136bc1418084990b97777a7a3a35563ec9b06 = substituteSource {
      src = fetchgit {
        name = "ecl_sigslots_lite-95d136bc1418084990b97777a7a3a35563ec9b06-source";
        url = "https://github.com/ros2-gbp/ecl_lite-release.git";
        rev = "95d136bc1418084990b97777a7a3a35563ec9b06";
        hash = "sha256-nGYQQNr6VnsCIPQoCQfLmIxpw1uEBrqSu1PjF4XPSxk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_sigslots_lite";
  version = "1.2.0-4";
  src = sources.ecl_sigslots_lite-95d136bc1418084990b97777a7a3a35563ec9b06;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ecl_build ecl_config ecl_errors ecl_license ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "This avoids use of dynamic storage (malloc/new) and thread safety (mutexes) to provide a very simple sigslots implementation that can be used for *very* embedded development.";
  };
}
