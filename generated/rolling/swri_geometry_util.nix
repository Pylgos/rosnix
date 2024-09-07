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
        rev = "2d5f9d5b5358f32f55ef836c65b07446ec41002a";
        hash = "sha256-/imOzUrsMi31ZIXk59SJ1V749qSb+O+sCZzGJnNU9PE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_geometry_util";
  version = "3.7.1-1";
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
    description = "Commonly used geometry routines, implemented in a ROS friendly package.";
  };
}
