{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  pybind11_vendor,
  python_cmake_module,
  rosSystemPackages,
  rpyutils,
  substituteSource,
}:
let
  sources = rec {
    lttngpy = substituteSource {
      src = fetchFromGitHub {
        name = "lttngpy-source";
        owner = "ros2-gbp";
        repo = "ros2_tracing-release";
        rev = "3df74a6dda3e0f58deee6918f6c31d1d756d1218";
        hash = "sha256-fJy8xdOuJMFOb2j6gqadR1qpL8QU3bIlvPfpMG3Ff9s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lttngpy";
  version = "8.2.2-1";
  src = sources.lttngpy;
  nativeBuildInputs = [ ament_cmake python_cmake_module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rpyutils ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ pybind11_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liblttng-ctl-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "liblttng-ctl Python bindings";
  };
}
