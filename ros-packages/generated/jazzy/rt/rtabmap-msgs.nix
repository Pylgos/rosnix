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
  version = "0.21.9-1";
  src = finalAttrs.passthru.sources."rtabmap_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime sensor-msgs std-msgs std-srvs ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_msgs" = substituteSource {
      src = fetchgit {
        name = "rtabmap_msgs-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "d2c0fe561a20b6210c6a29017836e35e06775500";
        hash = "sha256-gCdMLBdGSTE21+qNzuk1dmQ/+okpC0R6UMuokPwOLM8=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's msgs package.";
  };
})
