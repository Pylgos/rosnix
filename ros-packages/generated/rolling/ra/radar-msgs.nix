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
  version = "0.2.2-3";
  src = finalAttrs.passthru.sources."radar_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs std-msgs unique-identifier-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "radar_msgs" = substituteSource {
        src = fetchgit {
          name = "radar_msgs-source";
          url = "https://github.com/ros2-gbp/radar_msgs-release.git";
          rev = "bb0b8b238628c1200c0aade2ebf6be2768a5a602";
          hash = "sha256-HO0hAoc99su0O3J40Mywg7/qtbQJof/b5/wwBnx6xbI=";
        };
      };
    });
  };
  meta = {
    description = "Standard ROS messages for radars";
  };
})
