{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ecl_config,
  ecl_license,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "ecl_converters_lite" = substituteSource {
      src = fetchgit {
        name = "ecl_converters_lite-source";
        url = "https://github.com/ros2-gbp/ecl_lite-release.git";
        rev = "11f9c0317747fc6f91194c2cc986acb51c53eb7c";
        hash = "sha256-a8sm73bxxx6IYDP6tv76IbjyUHSAzx6QreCCBMQUePE=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ecl_converters_lite";
  version = "1.2.0-5";
  src = sources."ecl_converters_lite";
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ecl_config ecl_license ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "These are a very simple version of some of the functions in ecl_converters suitable for firmware development. That is, there is no use of new, templates or exceptions.";
  };
}
