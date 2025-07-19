{
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  ros-environment,
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
  version = "0.22.1-1";
  src = finalAttrs.passthru.sources."rtabmap_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs ros-environment rosidl-default-runtime sensor-msgs std-msgs std-srvs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs ros-environment rosidl-default-runtime sensor-msgs std-msgs std-srvs ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_msgs" = substituteSource {
      src = fetchgit {
        name = "rtabmap_msgs-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "7413d414454e030e8e82c97ce7356149f004cff6";
        hash = "sha256-MDSjeP7/8mqjEpdYsCTYhH1s//Lkal/hRhXRLGW7/+A=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's msgs package.";
  };
})
