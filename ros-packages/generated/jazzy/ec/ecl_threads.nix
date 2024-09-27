{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ecl_build,
  ecl_concepts,
  ecl_config,
  ecl_errors,
  ecl_exceptions,
  ecl_license,
  ecl_time,
  ecl_utilities,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "ecl_threads" = substituteSource {
      src = fetchgit {
        name = "ecl_threads-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "9c8d0fd7fa1235ba4439c41fbfc2ec61bfb2d349";
        hash = "sha256-4lhOg9DicobrUw8Xel3vSP7jrgFI9obXn6dYbQEyFHA=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ecl_threads";
  version = "1.2.1-5";
  src = sources."ecl_threads";
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ecl_build ecl_concepts ecl_config ecl_errors ecl_exceptions ecl_license ecl_time ecl_utilities ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "This package provides the c++ extensions for a variety of threaded programming tools. These are usually different on different platforms, so the architecture for a cross-platform framework is also implemented.";
  };
}
