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
  version = "4.25.0-1";
  src = finalAttrs.passthru.sources."controller_interface";
  nativeBuildInputs = [ ament-cmake ament-cmake-gen-version-h ];
  propagatedBuildInputs = [ hardware-interface rclcpp-lifecycle realtime-tools sensor-msgs ];
  checkInputs = [ ament-cmake-gmock geometry-msgs sensor-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "controller_interface" = substituteSource {
      src = fetchgit {
        name = "controller_interface-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "fc1631297df5ea638f62c0778fbd20d7dbf4c717";
        hash = "sha256-YieNXpm2ibIuWjXd1Ctf0+O4V8+yJ8i1r80P/SrHN9M=";
      };
    };
  });
  meta = {
    description = "Description of controller_interface";
  };
})
