{
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  rosidl-default-generators,
  sensor-msgs,
  std-msgs,
  substituteSource,
  vision-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "depthai_ros_msgs";
  version = "2.11.0-1";
  src = finalAttrs.passthru.sources."depthai_ros_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rclcpp sensor-msgs std-msgs vision-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "depthai_ros_msgs" = substituteSource {
      src = fetchgit {
        name = "depthai_ros_msgs-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "c46d2ee11821bb1f2110e9a1a31bf83384649973";
        hash = "sha256-FD6Nuae18ezLlHqh445X5Gxaq1kCSo2Gdt9vrKK7cOE=";
      };
    };
  });
  meta = {
    description = "Package to keep interface independent of the driver";
  };
})
