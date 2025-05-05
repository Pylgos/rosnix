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
  version = "2.12.3-1";
  src = finalAttrs.passthru.sources."moveit_setup_assistant";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-cpp rclcpp ];
  propagatedBuildInputs = [ moveit-configs-utils moveit-setup-app-plugins moveit-setup-controllers moveit-setup-core-plugins moveit-setup-framework moveit-setup-srdf-plugins pluginlib ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qtbase5-dev" ]; };
  checkInputs = [ ament-cmake-gtest moveit-resources-panda-moveit-config ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_setup_assistant" = substituteSource {
      src = fetchgit {
        name = "moveit_setup_assistant-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "cfeb4da24a6ba90cf3511084a801905851412efd";
        hash = "sha256-p9Z3nfkkqiBvUCtO6IGACzaUuGJ/6V9+5ibY0KlV5Co=";
      };
    };
  });
  meta = {
    description = "Generates a configuration package that makes it easy to use MoveIt";
  };
})
