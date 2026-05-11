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
  version = "3.2.0-1";
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
        rev = "f25d780b37f10e30f7e61dc873b19beb67b9d73d";
        hash = "sha256-fUMkbfTSIN9Sp+haXZdyrLJS+tiBQHPmDfAngHTt9ow=";
      };
    };
  });
  meta = {
    description = "Package to keep interface independent of the driver";
  };
})
