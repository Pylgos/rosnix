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
  substituteSource,
}:
let
  sources = rec {
    ecl_streams = substituteSource {
      src = fetchgit {
        name = "ecl_streams-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "9526a2f86060c201b2866ad2f0dd380cda29cf59";
        hash = "sha256-IpgY894/j+PnAx+KIYX8Wvb7yve2eAvnuYrKq0ZgX0s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_streams";
  version = "1.2.1-4";
  src = sources.ecl_streams;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_concepts ecl_converters ecl_devices ecl_errors ecl_license ecl_time ecl_type_traits ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "These are lightweight text streaming classes that connect to standardised ecl type devices.";
  };
}
