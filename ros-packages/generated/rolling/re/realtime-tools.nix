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
  version = "4.2.0-1";
  src = finalAttrs.passthru.sources."realtime_tools";
  propagatedNativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rclcpp-action ros2-control-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-dev" "libcap-dev" ]; };
  checkInputs = [ ament-cmake-gmock lifecycle-msgs rclcpp-lifecycle test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "realtime_tools" = substituteSource {
      src = fetchgit {
        name = "realtime_tools-source";
        url = "https://github.com/ros2-gbp/realtime_tools-release.git";
        rev = "cce77a53eabd2313d67591f3bf2346f1ec14fce7";
        hash = "sha256-j9wTdJb3SPpUbCQz4muiVv40lh9H+dDS0PRxMG4EH2g=";
      };
    };
  });
  meta = {
    description = "Contains a set of tools that can be used from a hard realtime thread, without breaking the realtime behavior.";
  };
})
