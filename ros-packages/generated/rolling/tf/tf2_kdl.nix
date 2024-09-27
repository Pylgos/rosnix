{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  orocos_kdl_vendor,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2_msgs,
  tf2_ros,
  tf2_ros_py,
}:
let
  sources = rec {
    tf2_kdl-8d26d45e4dc42bbd63f6131e87bf155be983bbf3 = substituteSource {
      src = fetchgit {
        name = "tf2_kdl-8d26d45e4dc42bbd63f6131e87bf155be983bbf3-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "8d26d45e4dc42bbd63f6131e87bf155be983bbf3";
        hash = "sha256-CB6YP4ogLmzcM74QaN9si3SxAC1WoeyJD7velkuF3is=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_kdl";
  version = "0.38.2-1";
  src = sources.tf2_kdl-8d26d45e4dc42bbd63f6131e87bf155be983bbf3;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs orocos_kdl_vendor tf2 tf2_ros tf2_ros_py ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest rclcpp tf2_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "KDL binding for tf2";
  };
}
