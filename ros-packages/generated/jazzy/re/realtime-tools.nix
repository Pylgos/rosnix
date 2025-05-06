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
  version = "3.5.1-1";
  src = finalAttrs.passthru.sources."realtime_tools";
  propagatedNativeBuildInputs = [ ament-cmake rclcpp rclcpp-action ros2-control-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-dev" "libcap-dev" ]; };
  propagatedBuildInputs = [ ament-cmake rclcpp rclcpp-action ros2-control-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-dev" "libcap-dev" ]; };
  checkInputs = [ ament-cmake-gmock lifecycle-msgs rclcpp-lifecycle test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "realtime_tools" = substituteSource {
      src = fetchgit {
        name = "realtime_tools-source";
        url = "https://github.com/ros2-gbp/realtime_tools-release.git";
        rev = "3bc7950b7cfe0e6c497d5af70895a0d4a73def94";
        hash = "sha256-4NENlWRYMKoM0uAuSw16HOgp1pQpo47RRtrfzkrrHgw=";
      };
    };
  });
  meta = {
    description = "Contains a set of tools that can be used from a hard\n    realtime thread, without breaking the realtime behavior.";
  };
})
