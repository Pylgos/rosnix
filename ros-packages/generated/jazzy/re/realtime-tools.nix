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
  rosSystemPackages,
  substituteSource,
  test-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "realtime_tools";
  version = "2.8.1-1";
  src = finalAttrs.passthru.sources."realtime_tools";
  propagatedNativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rclcpp-action ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libcap-dev" ]; };
  checkInputs = [ ament-cmake-gmock lifecycle-msgs rclcpp-lifecycle test-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "realtime_tools" = substituteSource {
        src = fetchgit {
          name = "realtime_tools-source";
          url = "https://github.com/ros2-gbp/realtime_tools-release.git";
          rev = "bdd0ca03785f6ea7c88898f64b4156d76625f554";
          hash = "sha256-6FP+c0lipDhCjJyrNTpU02fe3kTKuqJId1zinxJHfpQ=";
        };
      };
    });
  };
  meta = {
    description = "Contains a set of tools that can be used from a hard realtime thread, without breaking the realtime behavior.";
  };
})
