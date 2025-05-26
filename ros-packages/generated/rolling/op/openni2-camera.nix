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
  version = "2.3.0-1";
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
        rev = "e030bfa5947276f263a0921a665e6df701beab7a";
        hash = "sha256-/VEKHElP7GIl8yCwyXUKoQokvncs9MhQnSxHbwE5uMg=";
      };
    };
  });
  meta = {
    description = "Drivers for the Asus Xtion and Primesense Devices. For using a kinect\n  with ROS, try the ";
  };
})
