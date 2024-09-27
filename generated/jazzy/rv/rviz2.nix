{
  ament_cmake,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_lint_cmake,
  ament_cmake_pytest,
  ament_cmake_uncrustify,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclcpp,
  rosSystemPackages,
  rviz_common,
  rviz_default_plugins,
  rviz_ogre_vendor,
  sensor_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rviz2-3b3f992874426701325d7893a55f91f4669585ec = substituteSource {
      src = fetchgit {
        name = "rviz2-3b3f992874426701325d7893a55f91f4669585ec-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "3b3f992874426701325d7893a55f91f4669585ec";
        hash = "sha256-dWzegj6SxOz5J1AFW25GcsP59v4ywWyvP1k81QL8plg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rviz2";
  version = "14.1.5-1";
  src = sources.rviz2-3b3f992874426701325d7893a55f91f4669585ec;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rviz_common rviz_default_plugins rviz_ogre_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3" "qtbase5-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_cppcheck ament_cmake_cpplint ament_cmake_lint_cmake ament_cmake_pytest ament_cmake_uncrustify ament_cmake_xmllint ament_lint_auto geometry_msgs rclcpp sensor_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-yaml" ]; };
  meta = {
    description = "3D visualization tool for ROS.";
  };
}
