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
  rosSystemPackages,
  rpyutils,
  substituteSource,
}:
let
  sources = rec {
    lttngpy-2c7b30db3e61601b3dd5c535a1803e9d326cf83d = substituteSource {
      src = fetchgit {
        name = "lttngpy-2c7b30db3e61601b3dd5c535a1803e9d326cf83d-source";
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
  src = sources.lttngpy-2c7b30db3e61601b3dd5c535a1803e9d326cf83d;
  nativeBuildInputs = [ ament_cmake python_cmake_module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ pybind11_vendor rpyutils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liblttng-ctl-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "liblttng-ctl Python bindings";
  };
}
