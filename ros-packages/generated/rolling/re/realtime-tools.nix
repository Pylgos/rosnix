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
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."realtime_tools";
  propagatedNativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rclcpp-action ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libcap-dev" ]; };
  checkInputs = [ ament-cmake-gmock lifecycle-msgs rclcpp-lifecycle test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "realtime_tools" = substituteSource {
      src = fetchgit {
        name = "realtime_tools-source";
        url = "https://github.com/ros2-gbp/realtime_tools-release.git";
        rev = "eeaa1fce9686ac02d2e8370a1ed3a612295dfc8c";
        hash = "sha256-ZB2otiarNt0r4kXB/4YhDBug1pOKqqZBZe9CKoI/NA8=";
      };
    };
  });
  meta = {
    description = "Contains a set of tools that can be used from a hard realtime thread, without breaking the realtime behavior.";
  };
})
