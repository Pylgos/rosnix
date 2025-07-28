{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "realsense2_camera_msgs";
  version = "4.56.4-1";
  src = finalAttrs.passthru.sources."realsense2_camera_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime sensor-msgs std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime sensor-msgs std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "realsense2_camera_msgs" = substituteSource {
      src = fetchgit {
        name = "realsense2_camera_msgs-source";
        url = "https://github.com/ros2-gbp/realsense-ros-release.git";
        rev = "00a0c8ff60bfa4fc81d9bada13cf5bba85f16046";
        hash = "sha256-UdEVaznBrX0PrVoAB3d6QN6D7mu21OsxQgoE/OuyZ0I=";
      };
    };
  });
  meta = {
    description = "RealSense camera_msgs package containing realsense camera messages definitions";
  };
})
