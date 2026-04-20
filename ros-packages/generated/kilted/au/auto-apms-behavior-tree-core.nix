{
  action-msgs,
  ament-cmake,
  ament-cmake-copyright,
  ament-cmake-gtest,
  ament-cmake-python,
  ament-index-cpp,
  ament-index-python,
  auto-apms-util,
  behaviortree-cpp,
  buildAmentCmakePackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-action,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "auto_apms_behavior_tree_core";
  version = "1.5.1-1";
  src = finalAttrs.passthru.sources."auto_apms_behavior_tree_core";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ action-msgs ament-index-cpp ament-index-python auto-apms-util behaviortree-cpp rclcpp rclcpp-action ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "tinyxml2" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ action-msgs ament-index-cpp ament-index-python auto-apms-util behaviortree-cpp rclcpp rclcpp-action ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "tinyxml2" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-gtest example-interfaces ];
  passthru.sources = mkSourceSet (sources: {
    "auto_apms_behavior_tree_core" = substituteSource {
      src = fetchgit {
        name = "auto_apms_behavior_tree_core-source";
        url = "https://github.com/ros2-gbp/autoapms-release.git";
        rev = "336d544d7e4c46a79a465621193fae3a8def0425";
        hash = "sha256-95YZZZDJde+aYnYtIBQ/2Lf/W37unCvVLCY5o0+uuJ8=";
      };
    };
  });
  meta = {
    description = "Core functionality and cmake tools for AutoAPMS";
  };
})
