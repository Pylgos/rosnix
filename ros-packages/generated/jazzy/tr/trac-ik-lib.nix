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
  version = "2.0.2-1";
  src = finalAttrs.passthru.sources."trac_ik_lib";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs kdl-parser rclcpp urdf ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "libnlopt-cxx-dev" "libnlopt-dev" "pkg-config" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs kdl-parser rclcpp urdf ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libnlopt-cxx-dev" "libnlopt-dev" "pkg-config" ]; };
  passthru.sources = mkSourceSet (sources: {
    "trac_ik_lib" = substituteSource {
      src = fetchgit {
        name = "trac_ik_lib-source";
        url = "https://github.com/ros2-gbp/trac_ik-release.git";
        rev = "2163455ad8f661f39e6f72233ced85c8be546be7";
        hash = "sha256-kVzhOU5uMs+GYQBCkxvuso7pa02q3nrWTCiYbXWEBgg=";
      };
    };
  });
  meta = {
    description = "\n    TRAC-IK is a faster, significantly more reliable drop-in replacement for\n    KDL's pseudoinverse Jacobian solver.\n\n    The TRAC-IK library has a very similar API to KDL's IK solver calls,\n    except that the user passes a maximum time instead of a maximum number of\n    search iterations.  Additionally, TRAC-IK allows for error tolerances to\n    be set independently for each Cartesian dimension (x,y,z,roll,pitch.yaw).\n  ";
  };
})
