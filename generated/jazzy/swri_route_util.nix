{
  ament_cmake,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  marti_common_msgs,
  marti_nav_msgs,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  swri_geometry_util,
  swri_math_util,
  swri_roscpp,
  swri_transform_util,
  tf2_geometry_msgs,
  visualization_msgs,
}:
let
  sources = rec {
    swri_route_util = substituteSource {
      src = fetchFromGitHub {
        name = "swri_route_util-source";
        owner = "ros2-gbp";
        repo = "marti_common-release";
        rev = "8b72cc2d5e3bae48df52447f4ad700f8b19ce708";
        hash = "sha256-JrNjC+WpdcZ1MxZoIWWx+xD1zKAldVC0C4tWhSAD8+Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_route_util";
  version = "3.7.1-1";
  src = sources.swri_route_util;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ marti_common_msgs marti_nav_msgs rclcpp swri_geometry_util swri_math_util swri_roscpp swri_transform_util tf2_geometry_msgs visualization_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "This library provides functionality to simplify working with the navigation messages defined in marti_nav_msgs.";
  };
}
