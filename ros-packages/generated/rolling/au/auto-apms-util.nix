{
  ament-cmake,
  ament-cmake-copyright,
  ament-cmake-gtest,
  ament-cmake-python,
  ament-index-cpp,
  ament-index-python,
  auto-apms-interfaces,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-action,
  rcpputils,
  rosSystemPackages,
  substituteSource,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "auto_apms_util";
  version = "1.4.2-1";
  src = finalAttrs.passthru.sources."auto_apms_util";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ ament-index-cpp ament-index-python generate-parameter-library pluginlib rclcpp rclcpp-action rcpputils yaml-cpp-vendor ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ ament-index-cpp ament-index-python generate-parameter-library pluginlib rclcpp rclcpp-action rcpputils yaml-cpp-vendor ];
  checkInputs = [ ament-cmake-copyright ament-cmake-gtest auto-apms-interfaces ];
  passthru.sources = mkSourceSet (sources: {
    "auto_apms_util" = substituteSource {
      src = fetchgit {
        name = "auto_apms_util-source";
        url = "https://github.com/ros2-gbp/autoapms-release.git";
        rev = "03c6f4cddf91334e91e7c1a1b99550a65f536ec5";
        hash = "sha256-iwe05/Ph5e0j5OOGNEKmwj2JBBqGo7l9d0eYWAIqB9U=";
      };
    };
  });
  meta = {
    description = "AutoAPMS utilities";
  };
})
