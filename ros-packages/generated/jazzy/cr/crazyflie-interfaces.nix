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
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "crazyflie_interfaces";
  version = "1.0.1-1";
  src = finalAttrs.passthru.sources."crazyflie_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-generators rosidl-default-runtime std-srvs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-generators rosidl-default-runtime std-srvs ];
  passthru.sources = mkSourceSet (sources: {
    "crazyflie_interfaces" = substituteSource {
      src = fetchgit {
        name = "crazyflie_interfaces-source";
        url = "https://github.com/ros2-gbp/crazyswarm2-release.git";
        rev = "5c6cbac286915b3b4eccadc14aaf889efa1f6b01";
        hash = "sha256-ZXgAV5Sf7ZhGFosrQi1Miixnc2U+u1o+K6hmTzjAXHU=";
      };
    };
  });
  meta = {
    description = "Interfaces for Crazyswarm2 package.";
  };
})
