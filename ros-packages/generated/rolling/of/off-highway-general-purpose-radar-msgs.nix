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
  pname = "off_highway_general_purpose_radar_msgs";
  version = "1.2.0-1";
  src = finalAttrs.passthru.sources."off_highway_general_purpose_radar_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "off_highway_general_purpose_radar_msgs" = substituteSource {
      src = fetchgit {
        name = "off_highway_general_purpose_radar_msgs-source";
        url = "https://github.com/ros2-gbp/off_highway_sensor_drivers-release.git";
        rev = "33c72ecc382e6dd99ec2724eafd1150a650767c2";
        hash = "sha256-BRM3M1Cydf75wb2O9BrrNPU2mhnXdJaccdgWB7uSqc4=";
      };
    };
  });
  meta = {
    description = "The off_highway_general_purpose_radar_msgs package";
  };
})
