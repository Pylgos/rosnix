{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ecl_build,
  ecl_config,
  ecl_errors,
  ecl_exceptions,
  ecl_license,
  ecl_threads,
  ecl_time,
  ecl_time_lite,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_ipc = substituteSource {
      src = fetchgit {
        name = "ecl_ipc-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "591c2d181016f5c4ea267c904d7da916fd09074a";
        hash = "sha256-VScic0GudpLDyw3R7bdxdgKjaPeyx0ynFGMpfB66eRo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_ipc";
  version = "1.2.1-5";
  src = sources.ecl_ipc;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_config ecl_errors ecl_exceptions ecl_license ecl_threads ecl_time ecl_time_lite ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Interprocess mechanisms vary greatly across platforms - sysv, posix, win32, there are more than a few. This package provides an infrastructure to allow for developing cross platform c++ wrappers around the lower level c api's that handle these mechanisms. These make it not only easier to utilise such mechanisms, but allow it to be done consistently across platforms.";
  };
}
