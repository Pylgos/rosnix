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
  version = "4.26.0-1";
  src = finalAttrs.passthru.sources."controller_interface";
  nativeBuildInputs = [ ament-cmake ament-cmake-gen-version-h ];
  propagatedBuildInputs = [ hardware-interface rclcpp-lifecycle realtime-tools sensor-msgs ];
  checkInputs = [ ament-cmake-gmock geometry-msgs sensor-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "controller_interface" = substituteSource {
      src = fetchgit {
        name = "controller_interface-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "e4b80837839d1f1fe33d6d21a4d1c7cd1ad18547";
        hash = "sha256-/tGrYQs3DGr+sPtAmsgruF3MK9583Lke+68mg+u+aNw=";
      };
    };
  });
  meta = {
    description = "Description of controller_interface";
  };
})
