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
  version = "0.14.1-2";
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
        rev = "f681f3d65ff8e2937ae0c02a93163231dc607203";
        hash = "sha256-IkpnM1ihrncyeRCgwruS/AigzelhzEvXiKbf595BBbA=";
      };
    };
  });
  meta = {
    description = "ouster_ros message and service definitions";
  };
})
