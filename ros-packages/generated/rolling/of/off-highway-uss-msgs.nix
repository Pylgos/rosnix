{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "off_highway_uss_msgs";
  version = "1.1.0-2";
  src = finalAttrs.passthru.sources."off_highway_uss_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ geometry-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "off_highway_uss_msgs" = substituteSource {
      src = fetchgit {
        name = "off_highway_uss_msgs-source";
        url = "https://github.com/ros2-gbp/off_highway_sensor_drivers-release.git";
        rev = "5628b952474224e2cd6a83abbf36d573b4d3190d";
        hash = "sha256-aIMUFwin4uonP0uQ5rpohAxKDt7Wy051CRBpHov/y28=";
      };
    };
  });
  meta = {
    description = "The off_highway_uss_msgs package";
  };
})
