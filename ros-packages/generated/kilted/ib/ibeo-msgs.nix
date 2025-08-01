{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ibeo_msgs";
  version = "4.0.0-4";
  src = finalAttrs.passthru.sources."ibeo_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces ros-environment rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces ros-environment rosidl-default-generators rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ibeo_msgs" = substituteSource {
      src = fetchgit {
        name = "ibeo_msgs-source";
        url = "https://github.com/ros2-gbp/astuff_sensor_msgs-release.git";
        rev = "3cc59fef8c4b3910e4bb8bb7a0e0b87b95dcad55";
        hash = "sha256-RLaDU8WKC534uEb0HZcS/iP0//JhyyaFVG8osixglEY=";
      };
    };
  });
  meta = {
    description = "The ibeo_msgs package";
  };
})
