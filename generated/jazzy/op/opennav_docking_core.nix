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
  nav2_msgs,
  nav2_util,
  rclcpp,
  rclcpp_lifecycle,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    opennav_docking_core-69b581c8a40c3de740daf16d3ebfd81f2a22ec0c = substituteSource {
      src = fetchgit {
        name = "opennav_docking_core-69b581c8a40c3de740daf16d3ebfd81f2a22ec0c-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "69b581c8a40c3de740daf16d3ebfd81f2a22ec0c";
        hash = "sha256-wHNFjeStID6b7cEMbW62F0sGSTEYxpyJGF7f48MUmdk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "opennav_docking_core";
  version = "1.3.2-1";
  src = sources.opennav_docking_core-69b581c8a40c3de740daf16d3ebfd81f2a22ec0c;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ nav2_msgs nav2_util rclcpp rclcpp_lifecycle ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A set of headers for plugins core to the opennav docking framework";
  };
}
