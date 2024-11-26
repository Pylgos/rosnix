{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  kdl-parser,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  urdf,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "trac_ik_lib";
  version = "2.0.1-1";
  src = finalAttrs.passthru.sources."trac_ik_lib";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ geometry-msgs kdl-parser rclcpp urdf ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libnlopt-cxx-dev" "libnlopt-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "trac_ik_lib" = substituteSource {
      src = fetchgit {
        name = "trac_ik_lib-source";
        url = "https://github.com/ros2-gbp/trac_ik-release.git";
        rev = "7caceeb979beee59aa99202a48575b16fc72918c";
        hash = "sha256-RHtJG5zWq6hgg1ylgO5tkkidAlHTg7G+wMzeoB8s6p8=";
      };
    };
  });
  meta = {
    description = "TRAC-IK is a faster, significantly more reliable drop-in replacement for KDL's pseudoinverse Jacobian solver. The TRAC-IK library has a very similar API to KDL's IK solver calls, except that the user passes a maximum time instead of a maximum number of search iterations. Additionally, TRAC-IK allows for error tolerances to be set independently for each Cartesian dimension (x,y,z,roll,pitch.yaw).";
  };
})
