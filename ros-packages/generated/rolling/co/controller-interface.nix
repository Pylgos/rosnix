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
  version = "5.1.0-1";
  src = finalAttrs.passthru.sources."controller_interface";
  nativeBuildInputs = [ ament-cmake ament-cmake-gen-version-h ];
  propagatedNativeBuildInputs = [ hardware-interface rclcpp-lifecycle realtime-tools ros2-control-cmake sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" ]; };
  buildInputs = [ ament-cmake ament-cmake-gen-version-h ];
  propagatedBuildInputs = [ hardware-interface rclcpp-lifecycle realtime-tools ros2-control-cmake sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" ]; };
  checkInputs = [ ament-cmake-gmock geometry-msgs sensor-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "controller_interface" = substituteSource {
      src = fetchgit {
        name = "controller_interface-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "2ce4d4c810f84994a8c2b7cbd5b82f92ec68696e";
        hash = "sha256-p3P+PaAQZpgh2UTIopKMc6DGr6Qe1E3z3SZ/WszFx2s=";
      };
    };
  });
  meta = {
    description = "Base classes for controllers and syntax cookies for supporting common sensor types in controllers and broadcasters";
  };
})
