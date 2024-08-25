{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav2_common,
  nav2_util,
  rclcpp,
  rclcpp_components,
  substituteSource,
}:
let
  sources = rec {
    nav2_velocity_smoother = substituteSource {
      src = fetchgit {
        name = "nav2_velocity_smoother-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "dd8c8e95fafa2102e5abb0e51fcef8e07294ad66";
        hash = "sha256-+bFcukPpghbMv5pgmnkiAa0Mr6R4OAXXCsJH4y1D/K8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_velocity_smoother";
  version = "1.3.1-1";
  src = sources.nav2_velocity_smoother;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs nav2_common nav2_util rclcpp rclcpp_components ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Nav2's Output velocity smoother";
  };
}
