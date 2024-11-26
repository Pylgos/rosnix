{
  ament-cmake,
  ament-cmake-gtest,
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
  rosidl-cmake,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "sensor_msgs";
  version = "5.4.2-1";
  src = finalAttrs.passthru.sources."sensor_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common rosidl-cmake ];
  passthru = {
    sources = mkSourceSet (sources: {
      "sensor_msgs" = substituteSource {
        src = fetchgit {
          name = "sensor_msgs-source";
          url = "https://github.com/ros2-gbp/common_interfaces-release.git";
          rev = "2c189690c9c6e02e9734e7befb1f644e5ee7427e";
          hash = "sha256-L1vpCfMbKQBw/M/OzPW72ODKFhBXrecnP3ZaJRGxmMQ=";
        };
      };
    });
  };
  meta = {
    description = "A package containing some sensor data related message and service definitions.";
  };
})
