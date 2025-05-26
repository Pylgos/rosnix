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
  version = "1.0.6-1";
  src = finalAttrs.passthru.sources."odom_to_tf_ros2";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs nav-msgs rclcpp tf2-geometry-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs rclcpp tf2-geometry-msgs tf2-ros ];
  passthru.sources = mkSourceSet (sources: {
    "odom_to_tf_ros2" = substituteSource {
      src = fetchgit {
        name = "odom_to_tf_ros2-source";
        url = "https://github.com/ros2-gbp/odom_to_tf_ros2-release.git";
        rev = "7f22a791a22a9082ffda73c4f40cb74444ce1a60";
        hash = "sha256-0XxOcZQ4mNoE8w3RV/dCyfn9xxDUBDBfGVjh8764Uog=";
      };
    };
  });
  meta = {
    description = "A simple ros2 package (node) that reads an odom topic and generates the equivalent tf connection (transformation). It also provides options to override frame names, or just use the ones in the original odom topic.";
  };
})
