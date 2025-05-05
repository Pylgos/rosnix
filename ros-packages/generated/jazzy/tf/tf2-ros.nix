{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  message-filters,
  mkSourceSet,
  rcl-interfaces,
  rclcpp,
  rclcpp-action,
  rclcpp-components,
  rosSystemPackages,
  rosgraph-msgs,
  substituteSource,
  tf2,
  tf2-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tf2_ros";
  version = "0.36.10-1";
  src = finalAttrs.passthru.sources."tf2_ros";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs message-filters rcl-interfaces rclcpp-action rclcpp-components tf2 tf2-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common rosgraph-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "tf2_ros" = substituteSource {
      src = fetchgit {
        name = "tf2_ros-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "cc5b91dc3a5607cd97f43acf93c60f7480161a3d";
        hash = "sha256-ZRB3XOmcSQgDxgBn7+qxd7vW9kk7hqqBjGCWAyt2/zU=";
      };
    };
  });
  meta = {
    description = "This package contains the C++ ROS bindings for the tf2 library";
  };
})
