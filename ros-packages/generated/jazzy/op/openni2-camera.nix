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
let
  sources = mkSourceSet (sources: {
    "openni2_camera" = substituteSource {
      src = fetchgit {
        name = "openni2_camera-source";
        url = "https://github.com/ros2-gbp/openni2_camera-release.git";
        rev = "fa3aa1c28af9b8856e6c351b3d237525b402322b";
        hash = "sha256-CSYqk5PiDxVyyGakTWJCE4KM4z/tKVAPGLvPgx506rM=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "openni2_camera";
  version = "2.2.2-1";
  src = finalAttrs.passthru.sources."openni2_camera";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin-interfaces camera-info-manager depth-image-proc image-transport rclcpp rclcpp-components rosidl-default-runtime sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopenni2-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Drivers for the Asus Xtion and Primesense Devices. For using a kinect with ROS, try the";
  };
})
