{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ecl_build,
  ecl_license,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ecl_config-19f1dae955c6a2accdf1e788f69880c70658033c = substituteSource {
      src = fetchgit {
        name = "ecl_config-19f1dae955c6a2accdf1e788f69880c70658033c-source";
        url = "https://github.com/ros2-gbp/ecl_lite-release.git";
        rev = "19f1dae955c6a2accdf1e788f69880c70658033c";
        hash = "sha256-eH0ytH9tso+gcYGQSXy83dIPeklxY5K+/Jo0cV9qAxI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_config";
  version = "1.2.0-5";
  src = sources.ecl_config-19f1dae955c6a2accdf1e788f69880c70658033c;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ecl_build ecl_license ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "These tools inspect and describe your system with macros, types and functions.";
  };
}
