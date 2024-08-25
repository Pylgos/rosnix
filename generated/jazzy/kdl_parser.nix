{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  orocos_kdl_vendor,
  rcutils,
  substituteSource,
  urdf,
  urdfdom_headers,
}:
let
  sources = rec {
    kdl_parser = substituteSource {
      src = fetchgit {
        name = "kdl_parser-source";
        url = "https://github.com/ros2-gbp/kdl_parser-release.git";
        rev = "62e426bc35f02277867bdb8204444c055c6d0d85";
        hash = "sha256-0pqo6+kDyd4jq/rIh9aXBLrvipyDVHZKbj2VAlBvZ/g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kdl_parser";
  version = "2.11.0-3";
  src = sources.kdl_parser;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ orocos_kdl_vendor rcutils urdf urdfdom_headers ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "The Kinematics and Dynamics Library (KDL) defines a tree structure to represent the kinematic and dynamic parameters of a robot mechanism.";
  };
}
