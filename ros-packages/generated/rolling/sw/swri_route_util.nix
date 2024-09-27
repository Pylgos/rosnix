{
  ament_cmake,
  buildRosPackage,
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
    swri_route_util-eacb8ff673c5a1ab57ec2ce18e4ef50d7fe3694d = substituteSource {
      src = fetchgit {
        name = "swri_route_util-eacb8ff673c5a1ab57ec2ce18e4ef50d7fe3694d-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "eacb8ff673c5a1ab57ec2ce18e4ef50d7fe3694d";
        hash = "sha256-YxAqGUa1ocmwiqAltTWqsseGPMp3R2hdRa+sIpB6zC0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_route_util";
  version = "3.7.3-1";
  src = sources.swri_route_util-eacb8ff673c5a1ab57ec2ce18e4ef50d7fe3694d;
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
