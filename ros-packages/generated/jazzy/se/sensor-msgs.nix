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
  version = "5.3.5-1";
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
          rev = "25593c7bb356cae9badacb11b6598a0b1b639901";
          hash = "sha256-hszAgR55yQyD6P85LEtYsMVCaf4OpnWk0gS5G8tjEdk=";
        };
      };
    });
  };
  meta = {
    description = "A package containing some sensor data related message and service definitions.";
  };
})
