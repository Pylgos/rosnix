{
  ament-cmake,
  ament-cmake-copyright,
  ament-cmake-python,
  ament-index-python,
  auto-apms-behavior-tree-core,
  auto-apms-interfaces,
  auto-apms-util,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  geometry-msgs,
  mkSourceSet,
  rcl-interfaces,
  rclcpp,
  rclcpp-action,
  rclcpp-components,
  rclpy,
  ros2cli,
  ros2param,
  rosSystemPackages,
  std-srvs,
  substituteSource,
  tf2-geometry-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "auto_apms_behavior_tree";
  version = "1.5.0-1";
  src = finalAttrs.passthru.sources."auto_apms_behavior_tree";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ ament-index-python auto-apms-behavior-tree-core auto-apms-interfaces auto-apms-util generate-parameter-library geometry-msgs rcl-interfaces rclcpp rclcpp-action rclcpp-components rclpy ros2cli ros2param std-srvs tf2-geometry-msgs ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ ament-index-python auto-apms-behavior-tree-core auto-apms-interfaces auto-apms-util generate-parameter-library geometry-msgs rcl-interfaces rclcpp rclcpp-action rclcpp-components rclpy ros2cli ros2param std-srvs tf2-geometry-msgs ];
  checkInputs = [ ament-cmake-copyright ];
  passthru.sources = mkSourceSet (sources: {
    "auto_apms_behavior_tree" = substituteSource {
      src = fetchgit {
        name = "auto_apms_behavior_tree-source";
        url = "https://github.com/ros2-gbp/autoapms-release.git";
        rev = "e6d5c67d52444a760fd9a9dd0685ea10d636dbe4";
        hash = "sha256-EGySlUjZqKC4jlqv56ELYqKUEARDj9nbHr9HB6hUoPY=";
      };
    };
  });
  meta = {
    description = "Standard AutoAPMS behavior tree nodes and deployment tools";
  };
})
