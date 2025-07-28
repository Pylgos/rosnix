{
  action-msgs,
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
  version = "4.56.4-3";
  src = finalAttrs.passthru.sources."realsense2_camera_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ action-msgs builtin-interfaces rosidl-default-runtime sensor-msgs std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces rosidl-default-runtime sensor-msgs std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "realsense2_camera_msgs" = substituteSource {
      src = fetchgit {
        name = "realsense2_camera_msgs-source";
        url = "https://github.com/ros2-gbp/realsense-ros-release.git";
        rev = "97bd68dd164e80742914351187977fc1e36f4a3e";
        hash = "sha256-OENkZ4V1Ye5xz+ya5/kDJpgKsj58dFhfeRilYordvfs=";
      };
    };
  });
  meta = {
    description = "RealSense camera_msgs package containing realsense camera messages definitions";
  };
})
