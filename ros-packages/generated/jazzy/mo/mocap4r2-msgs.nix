{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
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
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mocap4r2_msgs";
  version = "0.1.0-1";
  src = finalAttrs.passthru.sources."mocap4r2_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rclcpp rosidl-default-generators std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rclcpp rosidl-default-generators std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "mocap4r2_msgs" = substituteSource {
      src = fetchgit {
        name = "mocap4r2_msgs-source";
        url = "https://github.com/MOCAP4ROS2-Project/mocap4r2_msgs-release.git";
        rev = "8a9a0e7b876c35a06540ee6d636a538cce27bb5b";
        hash = "sha256-7bmF31ydAms54GqhSdcnqw3bZrymhy6PuzA/wMxBSlk=";
      };
    };
  });
  meta = {
    description = "Interfaces for Mocap4ROS2 project";
  };
})
