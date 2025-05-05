{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "odom_to_tf_ros2";
  version = "1.0.5-2";
  src = finalAttrs.passthru.sources."odom_to_tf_ros2";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs tf2-geometry-msgs tf2-ros ];
  passthru.sources = mkSourceSet (sources: {
    "odom_to_tf_ros2" = substituteSource {
      src = fetchgit {
        name = "odom_to_tf_ros2-source";
        url = "https://github.com/ros2-gbp/odom_to_tf_ros2-release.git";
        rev = "73061750ed9bc07b3e33544a1494103ddc4c0dc2";
        hash = "sha256-f/G8He9L+mH9rkDay95ERtdcWDWXtJt+rJi0k0ZODjU=";
      };
    };
  });
  meta = {
    description = "A simple ros2 package (node) that reads an odom topic and generates the equivalent tf connection (transformation). It also provides options to override frame names, or just use the ones in the original odom topic.";
  };
})
