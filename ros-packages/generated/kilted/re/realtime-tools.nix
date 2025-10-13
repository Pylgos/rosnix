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
  version = "4.7.0-1";
  src = finalAttrs.passthru.sources."realtime_tools";
  propagatedNativeBuildInputs = [ ament-cmake rclcpp rclcpp-action ros2-control-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-dev" "libcap-dev" ]; };
  propagatedBuildInputs = [ ament-cmake rclcpp rclcpp-action ros2-control-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-dev" "libcap-dev" ]; };
  checkInputs = [ ament-cmake-gmock lifecycle-msgs rclcpp-lifecycle test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "realtime_tools" = substituteSource {
      src = fetchgit {
        name = "realtime_tools-source";
        url = "https://github.com/ros2-gbp/realtime_tools-release.git";
        rev = "d42952abaf0fd53712addffabe9b29a15fec9af1";
        hash = "sha256-6RJaKTGw14WtA56kYFI3sMUhDkaKRbEr2zIWjcM/KpQ=";
      };
    };
  });
  meta = {
    description = "Contains a set of tools that can be used from a hard\n    realtime thread, without breaking the realtime behavior.";
  };
})
