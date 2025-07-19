{
  ament-cmake,
  ament-cmake-gmock,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-action,
  rclcpp-lifecycle,
  ros2-control-cmake,
  rosSystemPackages,
  substituteSource,
  test-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "realtime_tools";
  version = "4.4.0-1";
  src = finalAttrs.passthru.sources."realtime_tools";
  propagatedNativeBuildInputs = [ ament-cmake rclcpp rclcpp-action ros2-control-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-dev" "libcap-dev" ]; };
  propagatedBuildInputs = [ ament-cmake rclcpp rclcpp-action ros2-control-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-dev" "libcap-dev" ]; };
  checkInputs = [ ament-cmake-gmock lifecycle-msgs rclcpp-lifecycle test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "realtime_tools" = substituteSource {
      src = fetchgit {
        name = "realtime_tools-source";
        url = "https://github.com/ros2-gbp/realtime_tools-release.git";
        rev = "b54d66fb9252a8b1528fbed050d653804cb5cd71";
        hash = "sha256-etOqCIj2oM5W8g8mXm8KEc+zVCchO+sBv2dOpCo678Y=";
      };
    };
  });
  meta = {
    description = "Contains a set of tools that can be used from a hard\n    realtime thread, without breaking the realtime behavior.";
  };
})
