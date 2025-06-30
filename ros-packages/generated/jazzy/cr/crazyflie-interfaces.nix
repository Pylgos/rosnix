{
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "crazyflie_interfaces";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."crazyflie_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-generators rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "crazyflie_interfaces" = substituteSource {
      src = fetchgit {
        name = "crazyflie_interfaces-source";
        url = "https://github.com/ros2-gbp/crazyswarm2-release.git";
        rev = "4f9228ae03280fb55752a9ff16968626ac457a6c";
        hash = "sha256-x0S6szuGRw3OcL+21C4t1auyN/hS0Q9VR3nbhTMMKxs=";
      };
    };
  });
  meta = {
    description = "Interfaces for Crazyswarm2 package.";
  };
})
