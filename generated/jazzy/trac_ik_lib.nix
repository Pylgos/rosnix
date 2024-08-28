{
  ament_cmake,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  kdl_parser,
  nlopt,
  pkg-config,
  rclcpp,
  substituteSource,
  urdf,
}:
let
  sources = rec {
    trac_ik_lib = substituteSource {
      src = fetchgit {
        name = "trac_ik_lib-source";
        url = "https://github.com/ros2-gbp/trac_ik-release.git";
        rev = "7caceeb979beee59aa99202a48575b16fc72918c";
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
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ eigen pkg-config ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs kdl_parser nlopt rclcpp urdf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "TRAC-IK is a faster, significantly more reliable drop-in replacement for KDL's pseudoinverse Jacobian solver. The TRAC-IK library has a very similar API to KDL's IK solver calls, except that the user passes a maximum time instead of a maximum number of search iterations. Additionally, TRAC-IK allows for error tolerances to be set independently for each Cartesian dimension (x,y,z,roll,pitch.yaw).";
  };
}
