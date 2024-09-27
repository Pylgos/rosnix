{
  ament_cmake,
  ament_cmake_lint_cmake,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
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
    rviz2-429eb1da1f3cec77cf33c7029e0a698f1c48e425 = substituteSource {
      src = fetchgit {
        name = "rviz2-429eb1da1f3cec77cf33c7029e0a698f1c48e425-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "429eb1da1f3cec77cf33c7029e0a698f1c48e425";
        hash = "sha256-Psm9m/If+FbxR2caYYQTpowhUvPyDZrcWGhtcoJcmkM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rviz2";
  version = "14.2.6-1";
  src = sources.rviz2-429eb1da1f3cec77cf33c7029e0a698f1c48e425;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rviz_common rviz_default_plugins rviz_ogre_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3" "qtbase5-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_lint_cmake ament_cmake_pytest ament_lint_auto ament_lint_common geometry_msgs rclcpp sensor_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-yaml" ]; };
  meta = {
    description = "3D visualization tool for ROS.";
  };
}
