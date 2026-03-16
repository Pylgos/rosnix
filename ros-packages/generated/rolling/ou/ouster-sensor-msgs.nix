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
  version = "0.14.2-1";
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
        rev = "75385e637c258adc305b60bb4bf463b82ee3dfbd";
        hash = "sha256-cF9a+4sQBlFH+1qiuxUIhj+A2+r3DB3Ag6Tv88Gsc78=";
      };
    };
  });
  meta = {
    description = "ouster_ros message and service definitions";
  };
})
