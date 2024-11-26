{
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rclpy_message_converter_msgs";
  version = "2.0.1-4";
  src = finalAttrs.passthru.sources."rclpy_message_converter_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces ];
  passthru.sources = mkSourceSet (sources: {
    "rclpy_message_converter_msgs" = substituteSource {
      src = fetchgit {
        name = "rclpy_message_converter_msgs-source";
        url = "https://github.com/ros2-gbp/rospy_message_converter-release.git";
        rev = "68ed7f2459595f5a2b9727448de4484a0452e459";
        hash = "sha256-vWAM+JjdKQvohD6qBeuCVmL+zcOgq1szEkS8jYnSPkw=";
      };
    };
  });
  meta = {
    description = "Messages for rclpy_message_converter";
  };
})
