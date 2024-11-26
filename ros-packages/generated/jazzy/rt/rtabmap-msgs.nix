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
  version = "0.21.5-3";
  src = finalAttrs.passthru.sources."rtabmap_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime sensor-msgs std-msgs std-srvs ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_msgs" = substituteSource {
      src = fetchgit {
        name = "rtabmap_msgs-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "4d39aa5b5a1f290d1cb15cf5bcb5807d3d46afaf";
        hash = "sha256-7rObv5E6b5U7ZbUP+lk1aN9ZgzKeUiOstReb9/Fsh1E=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's msgs package.";
  };
})
