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
  pname = "depthai_ros_msgs_v3";
  version = "3.1.1-2";
  src = finalAttrs.passthru.sources."depthai_ros_msgs_v3";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rclcpp rosidl-default-generators sensor-msgs std-msgs vision-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rclcpp rosidl-default-generators sensor-msgs std-msgs vision-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "depthai_ros_msgs_v3" = substituteSource {
      src = fetchgit {
        name = "depthai_ros_msgs_v3-source";
        url = "https://github.com/luxonis/depthai-ros-v3-release.git";
        rev = "f33c9587b6c6de22a3b879e37ddb0e3c28870b70";
        hash = "sha256-uI8BvvS7OdnvD+oTQqgyUQ8AxEqRMHe4xL65XHX3o1I=";
      };
    };
  });
  meta = {
    description = "Package to keep interface independent of the driver";
  };
})
