{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
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
  pname = "autoware_sensing_msgs";
  version = "1.12.0-1";
  src = finalAttrs.passthru.sources."autoware_sensing_msgs";
  nativeBuildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedNativeBuildInputs = [ geometry-msgs rosidl-default-runtime sensor-msgs std-msgs ];
  buildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-runtime sensor-msgs std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_sensing_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_sensing_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "1a9921926f499d9d4c3d6b2ed12400ada6bf22ff";
        hash = "sha256-GpJGjjK01IoHumYoxJJnLw+K9X1YE9wxn+vifODXf8o=";
      };
    };
  });
  meta = {
    description = "Autoware sensing messages package.";
  };
})
