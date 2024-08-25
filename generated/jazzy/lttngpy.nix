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
        rev = "1d2a357d75de1e5d115ceb0b5e3d17d18b8f123f";
        hash = "sha256-mo3tqXxJdLniu+FxFGa58ZhnR8/dFAV8o2+BrXActq8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lttngpy";
  version = "8.2.1-1";
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
