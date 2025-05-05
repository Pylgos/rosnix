{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-cpp,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-configs-utils,
  moveit-resources-panda-moveit-config,
  moveit-setup-app-plugins,
  moveit-setup-controllers,
  moveit-setup-core-plugins,
  moveit-setup-framework,
  moveit-setup-srdf-plugins,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_setup_assistant";
  version = "2.13.2-1";
  src = finalAttrs.passthru.sources."moveit_setup_assistant";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-cpp moveit-configs-utils moveit-setup-app-plugins moveit-setup-controllers moveit-setup-core-plugins moveit-setup-framework moveit-setup-srdf-plugins pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp moveit-configs-utils moveit-setup-app-plugins moveit-setup-controllers moveit-setup-core-plugins moveit-setup-framework moveit-setup-srdf-plugins pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qtbase5-dev" ]; };
  checkInputs = [ ament-cmake-gtest moveit-resources-panda-moveit-config ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_setup_assistant" = substituteSource {
      src = fetchgit {
        name = "moveit_setup_assistant-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "48057fad2c5614f1b7104a3b07f1259773b7dd4b";
        hash = "sha256-DH6W4M0VzVU9w6gvL+iRkZ4N9Fa9nkD1IOsb3eD9wfw=";
      };
    };
  });
  meta = {
    description = "Generates a configuration package that makes it easy to use MoveIt";
  };
})
