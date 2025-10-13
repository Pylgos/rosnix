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
  version = "3.0.7-1";
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
        rev = "b8d03c995236307848b87108718d08c66965f350";
        hash = "sha256-0fOAp0ICGLUgT1OxAfS12gU3gGH9w7YzgEVe0lObZK0=";
      };
    };
  });
  meta = {
    description = "Package to keep interface independent of the driver";
  };
})
