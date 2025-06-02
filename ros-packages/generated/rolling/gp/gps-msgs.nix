{
  ament-cmake,
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
  pname = "gps_msgs";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."gps_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "gps_msgs" = substituteSource {
      src = fetchgit {
        name = "gps_msgs-source";
        url = "https://github.com/ros2-gbp/gps_umd-release.git";
        rev = "398c690f3e04b3d957fb29b1e19b860ebeb9eb62";
        hash = "sha256-PgGWZ0DWJiRAeW+AckPrLNvYw7hRb1fTkCssmmogP7I=";
      };
    };
  });
  meta = {
    description = "GPS messages for use in GPS drivers";
  };
})
