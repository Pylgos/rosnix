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
  version = "2.14.3-1";
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
        rev = "1e4c40188dff8619c81fb90a5fb81a903054a2bf";
        hash = "sha256-8+/xFyztJk1l5dCxKhA0H0lsKsB/NS7mHm3S4Af4+SU=";
      };
    };
  });
  meta = {
    description = "Generates a configuration package that makes it easy to use MoveIt";
  };
})
