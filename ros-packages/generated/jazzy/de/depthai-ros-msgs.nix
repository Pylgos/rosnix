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
  version = "2.10.3-1";
  src = finalAttrs.passthru.sources."depthai_ros_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rclcpp sensor-msgs std-msgs vision-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "depthai_ros_msgs" = substituteSource {
      src = fetchgit {
        name = "depthai_ros_msgs-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "bf6919a0cdb92c90029cc38fb8e79d4884b6694d";
        hash = "sha256-SWFuoYO/CP0hmZhrH2z4H3RqP7VIcssvPBFiCsYfo+M=";
      };
    };
  });
  meta = {
    description = "Package to keep interface independent of the driver";
  };
})
