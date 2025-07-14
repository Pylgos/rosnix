{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-lint-auto,
  ament-lint-common,
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
  std-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "crazyflie_interfaces";
  version = "1.0.3-1";
  src = finalAttrs.passthru.sources."crazyflie_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs std-srvs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs std-srvs ];
  checkInputs = [ ament-cmake-cppcheck ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "crazyflie_interfaces" = substituteSource {
      src = fetchgit {
        name = "crazyflie_interfaces-source";
        url = "https://github.com/ros2-gbp/crazyswarm2-release.git";
        rev = "89817a68ab02ee4103a5b3cd8b69ff70ee8d52d6";
        hash = "sha256-JPUeMO85vRZVCxPBgwolmO7/LaMhVxomuwJN6CJE4yE=";
      };
    };
  });
  meta = {
    description = "Interfaces for Crazyswarm2 package.";
  };
})
