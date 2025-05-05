{
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  camera-info-manager,
  depth-image-proc,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "openni2_camera";
  version = "2.2.2-1";
  src = finalAttrs.passthru.sources."openni2_camera";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces camera-info-manager depth-image-proc image-transport rclcpp rclcpp-components rosidl-default-runtime sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libopenni2-dev" "pkg-config" ]; };
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces camera-info-manager depth-image-proc image-transport rclcpp rclcpp-components rosidl-default-runtime sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopenni2-dev" "pkg-config" ]; };
  passthru.sources = mkSourceSet (sources: {
    "openni2_camera" = substituteSource {
      src = fetchgit {
        name = "openni2_camera-source";
        url = "https://github.com/ros2-gbp/openni2_camera-release.git";
        rev = "fa3aa1c28af9b8856e6c351b3d237525b402322b";
        hash = "sha256-CSYqk5PiDxVyyGakTWJCE4KM4z/tKVAPGLvPgx506rM=";
      };
    };
  });
  meta = {
    description = "Drivers for the Asus Xtion and Primesense Devices. For using a kinect\n  with ROS, try the ";
  };
})
