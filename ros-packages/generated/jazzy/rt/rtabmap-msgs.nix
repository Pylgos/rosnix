{
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rtabmap_msgs";
  version = "0.22.0-1";
  src = finalAttrs.passthru.sources."rtabmap_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime sensor-msgs std-msgs std-srvs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime sensor-msgs std-msgs std-srvs ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_msgs" = substituteSource {
      src = fetchgit {
        name = "rtabmap_msgs-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "7daee78f17df014af6566c16b30d110a09ae2c4c";
        hash = "sha256-P0CelbrDK4cEiRM+DiUjgP+09IlLDVKgRsHpXnrqifY=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's msgs package.";
  };
})
