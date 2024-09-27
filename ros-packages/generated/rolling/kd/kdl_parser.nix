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
  rosSystemPackages,
  substituteSource,
  urdf,
  urdfdom_headers,
}:
let
  sources = rec {
    kdl_parser-cdbf9b2a8a2f95a13051dfb795e795b836e5530a = substituteSource {
      src = fetchgit {
        name = "kdl_parser-cdbf9b2a8a2f95a13051dfb795e795b836e5530a-source";
        url = "https://github.com/ros2-gbp/kdl_parser-release.git";
        rev = "cdbf9b2a8a2f95a13051dfb795e795b836e5530a";
        hash = "sha256-k9FAvPXK/EUOGHyUHB+uVIFTU+swbET5SO9mHMP450Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kdl_parser";
  version = "2.12.1-1";
  src = sources.kdl_parser-cdbf9b2a8a2f95a13051dfb795e795b836e5530a;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ orocos_kdl_vendor rcutils urdf urdfdom_headers ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The Kinematics and Dynamics Library (KDL) defines a tree structure to represent the kinematic and dynamic parameters of a robot mechanism.";
  };
}
