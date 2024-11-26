{
  ament-cmake,
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
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "visualization_msgs";
  version = "5.4.2-1";
  src = finalAttrs.passthru.sources."visualization_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime sensor-msgs std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "visualization_msgs" = substituteSource {
      src = fetchgit {
        name = "visualization_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "2eaf85aede3bcd7e70f471ed62129b8f5d0a566b";
        hash = "sha256-kDHBWTiU6dEIIdlXY+ZpuWZ7586wDOaaTIdMO+v8Gs0=";
      };
    };
  });
  meta = {
    description = "A package containing some visualization and interaction related message definitions.";
  };
})
