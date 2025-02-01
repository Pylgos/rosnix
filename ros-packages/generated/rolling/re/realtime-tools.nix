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
  version = "4.0.0-1";
  src = finalAttrs.passthru.sources."realtime_tools";
  propagatedNativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rclcpp-action ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-dev" "libcap-dev" ]; };
  checkInputs = [ ament-cmake-gmock lifecycle-msgs rclcpp-lifecycle test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "realtime_tools" = substituteSource {
      src = fetchgit {
        name = "realtime_tools-source";
        url = "https://github.com/ros2-gbp/realtime_tools-release.git";
        rev = "8a001078658e279d345e0d77e53564b695976f8b";
        hash = "sha256-1cMhy5dSdq5CdY16LwPXnbAADtfdmaDm5F1+JMkFQbg=";
      };
    };
  });
  meta = {
    description = "Contains a set of tools that can be used from a hard realtime thread, without breaking the realtime behavior.";
  };
})
