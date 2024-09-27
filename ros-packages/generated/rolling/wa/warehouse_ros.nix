{
  ament_cmake,
  ament_cmake_copyright,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  std_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    warehouse_ros-bf9c959640a5ea9429eb8373608127fcf8c63981 = substituteSource {
      src = fetchgit {
        name = "warehouse_ros-bf9c959640a5ea9429eb8373608127fcf8c63981-source";
        url = "https://github.com/ros2-gbp/warehouse_ros-release.git";
        rev = "bf9c959640a5ea9429eb8373608127fcf8c63981";
        hash = "sha256-X45/qATzogkTqKBnEvt1wH7hKl9/qSTTVboEsAuL/Es=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "warehouse_ros";
  version = "2.0.5-1";
  src = sources.warehouse_ros-bf9c959640a5ea9429eb8373608127fcf8c63981;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs pluginlib rclcpp std_msgs tf2 tf2_geometry_msgs tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "libssl-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_copyright ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Persistent storage of ROS messages";
  };
}
