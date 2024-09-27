{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    asio_cmake_module-2b840fd6e7471e2732d02884a3711aacb9e3be80 = substituteSource {
      src = fetchgit {
        name = "asio_cmake_module-2b840fd6e7471e2732d02884a3711aacb9e3be80-source";
        url = "https://github.com/ros2-gbp/transport_drivers-release.git";
        rev = "2b840fd6e7471e2732d02884a3711aacb9e3be80";
        hash = "sha256-S4As/gOIQQTIqYgblUDPs2pjBDmLPz4Ii2/CTMHhRUs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "asio_cmake_module";
  version = "1.2.0-4";
  src = sources.asio_cmake_module-2b840fd6e7471e2732d02884a3711aacb9e3be80;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A CMake module for using the ASIO network library";
  };
}
