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
  rcpputils,
  rosSystemPackages,
  rosgraph-msgs,
  substituteSource,
  tf2,
  tf2-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tf2_ros";
  version = "0.45.6-1";
  src = finalAttrs.passthru.sources."tf2_ros";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs message-filters rcl-interfaces rclcpp rclcpp-action rclcpp-components rcpputils tf2 tf2-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs message-filters rcl-interfaces rclcpp rclcpp-action rclcpp-components rcpputils tf2 tf2-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common rosgraph-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "tf2_ros" = substituteSource {
      src = fetchgit {
        name = "tf2_ros-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "cdc8780be8ebbce259d0cdb5912a60116fe68ac4";
        hash = "sha256-6A1Tlo/f0fIz8dhYlmElyaFNPjjGvYoGy3sRLZsdLeE=";
      };
    };
  });
  meta = {
    description = "\n    This package contains the C++ ROS bindings for the tf2 library\n  ";
  };
})
