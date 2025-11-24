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
  version = "0.2.0-1";
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
        rev = "50aca1331ff4a49a5a90c74d635f4d82ba7a1675";
        hash = "sha256-p7KMuABtaf0MYp+1EFA55/N+oRdxgaP6DA8B3PCl8h8=";
      };
    };
  });
  meta = {
    description = "Interfaces for Mocap4ROS2 project";
  };
})
