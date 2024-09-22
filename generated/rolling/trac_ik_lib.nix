{
  ament_cmake,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  kdl_parser,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  urdf,
}:
let
  sources = rec {
    trac_ik_lib = substituteSource {
      src = fetchFromGitHub {
        name = "trac_ik_lib-source";
        owner = "ros2-gbp";
        repo = "trac_ik-release";
        rev = "f05b24476d03bb7879a7a95b49c9820463c89bf9";
        hash = "sha256-RHtJG5zWq6hgg1ylgO5tkkidAlHTg7G+wMzeoB8s6p8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "trac_ik_lib";
  version = "2.0.1-1";
  src = sources.trac_ik_lib;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs kdl_parser rclcpp urdf ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libnlopt-cxx-dev" "libnlopt-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "TRAC-IK is a faster, significantly more reliable drop-in replacement for KDL's pseudoinverse Jacobian solver. The TRAC-IK library has a very similar API to KDL's IK solver calls, except that the user passes a maximum time instead of a maximum number of search iterations. Additionally, TRAC-IK allows for error tolerances to be set independently for each Cartesian dimension (x,y,z,roll,pitch.yaw).";
  };
}
