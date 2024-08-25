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
        rev = "597777768cc8df0a0d9366eb01b21ddecff2d043";
        hash = "sha256-SOT14TqgRvW80OdroY2wAtEEQ3+OXcKhLyf6R8ndzAk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kdl_parser";
  version = "2.12.0-1";
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
