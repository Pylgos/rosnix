{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pybind11_vendor,
  python_cmake_module,
  rpyutils,
  substituteSource,
}:
let
  sources = rec {
    lttngpy = substituteSource {
      src = fetchgit {
        name = "lttngpy-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
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
  nativeBuildInputs = [ ament_cmake python_cmake_module ];
  propagatedNativeBuildInputs = [ rpyutils ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pybind11_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common ];
  missingDependencies = [ "liblttng-ctl-dev" ];
  meta = {
    description = "liblttng-ctl Python bindings";
  };
}
