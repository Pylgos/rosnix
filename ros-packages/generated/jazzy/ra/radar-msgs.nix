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
  std-msgs,
  substituteSource,
  unique-identifier-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "radar_msgs";
  version = "0.2.2-4";
  src = finalAttrs.passthru.sources."radar_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-generators std-msgs unique-identifier-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-generators std-msgs unique-identifier-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "radar_msgs" = substituteSource {
      src = fetchgit {
        name = "radar_msgs-source";
        url = "https://github.com/ros2-gbp/radar_msgs-release.git";
        rev = "6c0b968beda9b9ca9623b7b2bea09a66ecf9f8de";
        hash = "sha256-HO0hAoc99su0O3J40Mywg7/qtbQJof/b5/wwBnx6xbI=";
      };
    };
  });
  meta = {
    description = "Standard ROS messages for radars";
  };
})
