{
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  rosidl-default-generators,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cascade_lifecycle_msgs";
  version = "2.0.0-3";
  src = finalAttrs.passthru.sources."cascade_lifecycle_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces lifecycle-msgs rclcpp rosidl-default-generators ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces lifecycle-msgs rclcpp rosidl-default-generators ];
  passthru.sources = mkSourceSet (sources: {
    "cascade_lifecycle_msgs" = substituteSource {
      src = fetchgit {
        name = "cascade_lifecycle_msgs-source";
        url = "https://github.com/ros2-gbp/cascade_lifecycle-release.git";
        rev = "e35b5bf7ac2a267a9aecddd6564b9894af3486ba";
        hash = "sha256-vr1h9TdjCkXvrxYIYrmyyXpL/IO9M0hByXfdsHA2FO4=";
      };
    };
  });
  meta = {
    description = "Messages for rclcpp_cascade_lifecycle package";
  };
})
