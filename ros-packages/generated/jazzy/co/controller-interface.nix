{
  ament-cmake,
  ament-cmake-gen-version-h,
  ament-cmake-gmock,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  hardware-interface,
  mkSourceSet,
  rclcpp-lifecycle,
  realtime-tools,
  ros2-control-cmake,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "controller_interface";
  version = "4.28.0-1";
  src = finalAttrs.passthru.sources."controller_interface";
  nativeBuildInputs = [ ament-cmake ament-cmake-gen-version-h ];
  propagatedBuildInputs = [ hardware-interface rclcpp-lifecycle realtime-tools ros2-control-cmake sensor-msgs ];
  checkInputs = [ ament-cmake-gmock geometry-msgs sensor-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "controller_interface" = substituteSource {
      src = fetchgit {
        name = "controller_interface-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "605de80e87492f7f3b38e3128144b0230bb4fc2b";
        hash = "sha256-6XqQYjP6QLO9kG9L88mUKHs82tzZhfSCtXZqdGvy0Ms=";
      };
    };
  });
  meta = {
    description = "Base classes for controllers and syntax cookies for supporting common sensor types in controllers and broadcasters";
  };
})
