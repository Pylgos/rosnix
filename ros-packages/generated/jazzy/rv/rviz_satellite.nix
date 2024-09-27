{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  angles,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rcpputils,
  rosSystemPackages,
  rviz_common,
  rviz_default_plugins,
  sensor_msgs,
  substituteSource,
  tf2_ros,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rviz_satellite-48cec4c14133a35baed22a947a2a48487f13ee06 = substituteSource {
      src = fetchgit {
        name = "rviz_satellite-48cec4c14133a35baed22a947a2a48487f13ee06-source";
        url = "https://github.com/nobleo/rviz_satellite-release.git";
        rev = "48cec4c14133a35baed22a947a2a48487f13ee06";
        hash = "sha256-md1r1pU2BDHugOSENoO8Um9K/tJKgazRl80PYKYzQok=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rviz_satellite";
  version = "4.1.0-1";
  src = sources.rviz_satellite-48cec4c14133a35baed22a947a2a48487f13ee06;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ angles rclcpp rcpputils rviz_common rviz_default_plugins sensor_msgs tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qtbase5-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Display satellite map tiles in RViz";
  };
}
