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
  version = "1.4.2-1";
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
        rev = "8c242910acb26e8885c718b032b9b9a8dce57089";
        hash = "sha256-cOvj5iP2AqDxd6J+FbsPO1riFbk9ZB01hErxZFxzcBI=";
      };
    };
  });
  meta = {
    description = "Core functionality and cmake tools for AutoAPMS";
  };
})
