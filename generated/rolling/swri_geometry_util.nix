{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rosSystemPackages,
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
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv_bridge rclcpp tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "geos" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Commonly used geometry routines, implemented in a ROS friendly package.";
  };
}
