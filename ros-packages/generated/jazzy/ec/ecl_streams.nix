{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ecl_build,
  ecl_concepts,
  ecl_converters,
  ecl_devices,
  ecl_errors,
  ecl_license,
  ecl_time,
  ecl_type_traits,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ecl_streams-73bdd35f128030911ff03e6720e4a5178d89a226 = substituteSource {
      src = fetchgit {
        name = "ecl_streams-73bdd35f128030911ff03e6720e4a5178d89a226-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "73bdd35f128030911ff03e6720e4a5178d89a226";
        hash = "sha256-IpgY894/j+PnAx+KIYX8Wvb7yve2eAvnuYrKq0ZgX0s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_streams";
  version = "1.2.1-5";
  src = sources.ecl_streams-73bdd35f128030911ff03e6720e4a5178d89a226;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ecl_build ecl_concepts ecl_converters ecl_devices ecl_errors ecl_license ecl_time ecl_type_traits ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "These are lightweight text streaming classes that connect to standardised ecl type devices.";
  };
}
