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
  substituteSource,
  tf2,
  tf2_msgs,
  tf2_ros,
  tf2_ros_py,
}:
let
  sources = rec {
    tf2_kdl = substituteSource {
      src = fetchgit {
        name = "tf2_kdl-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "9e4418691d02feb52e72dd3144cf4d52af70a38b";
        hash = "sha256-SIzfGQUX7Fpm4YXH6kf0jxFVNTxAIs9ucD2HRkZyfbg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_kdl";
  version = "0.36.4-1";
  src = sources.tf2_kdl;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs orocos_kdl_vendor tf2 tf2_ros tf2_ros_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest rclcpp tf2_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "KDL binding for tf2";
  };
}
