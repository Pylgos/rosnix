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
  substituteSource,
}:
let
  sources = rec {
    opennav_docking_core = substituteSource {
      src = fetchgit {
        name = "opennav_docking_core-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "60d49f10fc50268d784a15878700132abf8affea";
        hash = "sha256-elJcTijCzL4myAvXmtH6OJ+Gabr8OHPqBvNbTT4a2pY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "opennav_docking_core";
  version = "1.3.1-1";
  src = sources.opennav_docking_core;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nav2_msgs nav2_util rclcpp rclcpp_lifecycle ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "A set of headers for plugins core to the opennav docking framework";
  };
}
