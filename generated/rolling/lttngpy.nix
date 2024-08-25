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
        rev = "2c7b30db3e61601b3dd5c535a1803e9d326cf83d";
        hash = "sha256-5vRRZtQ1w7J1zFwuBTNgxd/Qkme4BbOoiL8Orc/GjtY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lttngpy";
  version = "8.3.0-1";
  src = sources.lttngpy;
  nativeBuildInputs = [ ament_cmake python_cmake_module ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pybind11_vendor rpyutils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common ];
  missingDependencies = [ "liblttng-ctl-dev" ];
  meta = {
    description = "liblttng-ctl Python bindings";
  };
}
