{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
  vision-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "zbar_ros_interfaces";
  version = "0.6.0-1";
  src = finalAttrs.passthru.sources."zbar_ros_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime vision-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime vision-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "zbar_ros_interfaces" = substituteSource {
      src = fetchgit {
        name = "zbar_ros_interfaces-source";
        url = "https://github.com/ros2-gbp/zbar_ros-release.git";
        rev = "fe518793f51e19584dca90504bbcabd4e0e0a549";
        hash = "sha256-SsaDsbUZ3f1a3gVgspGXknM9wXhNvAAQ9iENzeuZQgI=";
      };
    };
  });
  meta = {
    description = "Package containing interfaces for zbar_ros to use to publish results";
  };
})
