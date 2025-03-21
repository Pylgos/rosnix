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
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ builtin-interfaces camera-info-manager depth-image-proc image-transport rclcpp rclcpp-components rosidl-default-runtime sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopenni2-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "openni2_camera" = substituteSource {
      src = fetchgit {
        name = "openni2_camera-source";
        url = "https://github.com/ros2-gbp/openni2_camera-release.git";
        rev = "32a91a081983de487a72a9b92d8d8d5ee3161a5d";
        hash = "sha256-CSYqk5PiDxVyyGakTWJCE4KM4z/tKVAPGLvPgx506rM=";
      };
    };
  });
  meta = {
    description = "Drivers for the Asus Xtion and Primesense Devices. For using a kinect with ROS, try the";
  };
})
