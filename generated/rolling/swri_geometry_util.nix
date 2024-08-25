{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  cv_bridge,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  geos,
  pkg-config,
  rclcpp,
  substituteSource,
  tf2,
}:
let
  sources = rec {
    swri_geometry_util = substituteSource {
      src = fetchgit {
        name = "swri_geometry_util-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "fa70815e37bd9176d8dee31a6ad85bd88484f336";
        hash = "sha256-pz0GY5aY3hNn41PVQt01Ea+WrC/WQ0v6js4IpDasC0c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_geometry_util";
  version = "3.6.1-2";
  src = sources.swri_geometry_util;
  nativeBuildInputs = [ ament_cmake pkg-config ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge eigen geos rclcpp tf2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ];
  missingDependencies = [  ];
  meta = {
    description = "swri_geometry_util";
  };
}
