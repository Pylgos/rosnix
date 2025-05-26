{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "phidgets_msgs";
  version = "2.3.4-1";
  src = finalAttrs.passthru.sources."phidgets_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "phidgets_msgs" = substituteSource {
      src = fetchgit {
        name = "phidgets_msgs-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "e7eb9d0f6c2411ef1abe10d8935f5c94af06aefd";
        hash = "sha256-+dM6bMfq8KHFEiSlSnGCd2zw7/sJRL5MzUlybJ+ZpWA=";
      };
    };
  });
  meta = {
    description = "Custom ROS messages for Phidgets drivers";
  };
})
