{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ecl_build,
  ecl_errors,
  ecl_formatters,
  ecl_geometry,
  ecl_license,
  ecl_linear_algebra,
  ecl_math,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ecl_mobile_robot-a9c1743d3485af826a0cfa4f960ec5af94841de6 = substituteSource {
      src = fetchgit {
        name = "ecl_mobile_robot-a9c1743d3485af826a0cfa4f960ec5af94841de6-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "a9c1743d3485af826a0cfa4f960ec5af94841de6";
        hash = "sha256-NQJy3LdrqwiDAynl1fLCbDJz/A4qCxq6VpeaO+fr/4Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_mobile_robot";
  version = "1.2.1-5";
  src = sources.ecl_mobile_robot-a9c1743d3485af826a0cfa4f960ec5af94841de6;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ecl_build ecl_errors ecl_formatters ecl_geometry ecl_license ecl_linear_algebra ecl_math ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Contains transforms (e.g. differential drive inverse kinematics) for the various types of mobile robot platforms.";
  };
}
