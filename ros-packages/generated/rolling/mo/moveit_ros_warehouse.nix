{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_common,
  moveit_core,
  moveit_ros_planning,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2_eigen,
  tf2_ros,
  warehouse_ros,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_ros_warehouse-3f0a5bc925a41fe031c7c1da3fda551667e417e3 = substituteSource {
      src = fetchgit {
        name = "moveit_ros_warehouse-3f0a5bc925a41fe031c7c1da3fda551667e417e3-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "3f0a5bc925a41fe031c7c1da3fda551667e417e3";
        hash = "sha256-SGop2VOs6i1apL09EKpK6JikcNmoZsbZole8vEW4L8M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_ros_warehouse";
  version = "2.11.0-1";
  src = sources.moveit_ros_warehouse-3f0a5bc925a41fe031c7c1da3fda551667e417e3;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ moveit_common moveit_core moveit_ros_planning rclcpp tf2_eigen tf2_ros warehouse_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Components of MoveIt connecting to MongoDB";
  };
}
