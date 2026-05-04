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
  version = "1.3.0-2";
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
        rev = "6a2b459b7a4efda9d849fffcf19c76a26ee42dd9";
        hash = "sha256-tA++tqr6FA19lT+rm2ZUdsm8hIfnIZ3wb1SvIIG4PH0=";
      };
    };
  });
  meta = {
    description = "The off_highway_general_purpose_radar_msgs package";
  };
})
