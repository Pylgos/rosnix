{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  marti_common_msgs,
  marti_nav_msgs,
  python3Packages,
  rclcpp,
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
      src = fetchgit {
        name = "swri_route_util-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
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
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ marti_common_msgs marti_nav_msgs python3Packages.boost rclcpp swri_geometry_util swri_math_util swri_roscpp swri_transform_util tf2_geometry_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "This library provides functionality to simplify working with the navigation messages defined in marti_nav_msgs.";
  };
}
