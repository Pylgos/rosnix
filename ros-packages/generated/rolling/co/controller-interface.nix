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
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "controller_interface";
  version = "4.20.0-1";
  src = finalAttrs.passthru.sources."controller_interface";
  nativeBuildInputs = [ ament-cmake ament-cmake-gen-version-h ];
  propagatedBuildInputs = [ hardware-interface rclcpp-lifecycle realtime-tools sensor-msgs ];
  checkInputs = [ ament-cmake-gmock geometry-msgs sensor-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "controller_interface" = substituteSource {
        src = fetchgit {
          name = "controller_interface-source";
          url = "https://github.com/ros2-gbp/ros2_control-release.git";
          rev = "c5762aea4bfc2db8d54ebbc8fd38253e7e1022f9";
          hash = "sha256-KMc6WXgXekanXI6ukeQxLmA3BiepF+I8WOQhHMkOTPU=";
        };
      };
    });
  };
  meta = {
    description = "Description of controller_interface";
  };
})
