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
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ouster_sensor_msgs";
  version = "0.13.15-1";
  src = finalAttrs.passthru.sources."ouster_sensor_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ouster_sensor_msgs" = substituteSource {
      src = fetchgit {
        name = "ouster_sensor_msgs-source";
        url = "https://github.com/ros2-gbp/ouster-ros-release.git";
        rev = "1616a6814035608792548961db33e96b38d0e2d0";
        hash = "sha256-XJTE/298OwmITN4gA40TAjxYFMOYtro3LcBaV6e+kYk=";
      };
    };
  });
  meta = {
    description = "ouster_ros message and service definitions";
  };
})
