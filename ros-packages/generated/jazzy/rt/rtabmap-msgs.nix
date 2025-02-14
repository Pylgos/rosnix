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
  version = "0.21.10-1";
  src = finalAttrs.passthru.sources."rtabmap_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime sensor-msgs std-msgs std-srvs ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_msgs" = substituteSource {
      src = fetchgit {
        name = "rtabmap_msgs-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "9b91e8a65b63ca22b4f18b24ccfaaef34168ad3b";
        hash = "sha256-qV4efxjsvHQB4sVX1ivwdKCg7hkibRHWlOukB9Yw73I=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's msgs package.";
  };
})
