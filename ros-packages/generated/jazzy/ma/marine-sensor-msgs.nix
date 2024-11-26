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
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "marine_sensor_msgs";
  version = "2.1.0-2";
  src = finalAttrs.passthru.sources."marine_sensor_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "marine_sensor_msgs" = substituteSource {
      src = fetchgit {
        name = "marine_sensor_msgs-source";
        url = "https://github.com/ros2-gbp/marine_msgs-release.git";
        rev = "156f210aeeefe204e671aee16bc0b561960193cd";
        hash = "sha256-D0FezQ0OVWOXoPzNWC1TM9TGTcHR8hhUTXBz6uEQBnw=";
      };
    };
  });
  meta = {
    description = "The marine_sensor_msgs package, meant to contain messages for common underwater sensors (e.g., conductivity, turbidity, dissolved oxygen)";
  };
})
