{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "off_highway_mm7p10_msgs";
  version = "1.3.0-1";
  src = finalAttrs.passthru.sources."off_highway_mm7p10_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "off_highway_mm7p10_msgs" = substituteSource {
      src = fetchgit {
        name = "off_highway_mm7p10_msgs-source";
        url = "https://github.com/ros2-gbp/off_highway_sensor_drivers-release.git";
        rev = "f90b4c90f236bf21d9b26ceae4e8429b8ce851f8";
        hash = "sha256-aOo0JZAvAObpnaOMGva7OMOcEjxZrvkL2/EtVCtPIqs=";
      };
    };
  });
  meta = {
    description = "The off_highway_mm7p10_msgs package";
  };
})
