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
  version = "3.0.5-1";
  src = finalAttrs.passthru.sources."depthai_ros_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rclcpp rosidl-default-generators sensor-msgs std-msgs vision-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rclcpp rosidl-default-generators sensor-msgs std-msgs vision-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "depthai_ros_msgs" = substituteSource {
      src = fetchgit {
        name = "depthai_ros_msgs-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "8d3d805dc1fb1722f52d66529bf046a5659421d5";
        hash = "sha256-Gv7sskepaHKmDYW3ZI246qERiRrwOwO5LKd2Osi7GeE=";
      };
    };
  });
  meta = {
    description = "Package to keep interface independent of the driver";
  };
})
