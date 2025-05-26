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
  version = "2.0.5-1";
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
        rev = "4260c7e767918dece8d6e3af4ef8b5e5e47bca51";
        hash = "sha256-adXkqLYDiycom0LE7O/OG8Xt0cWAN5LjXo+xdFhFET8=";
      };
    };
  });
  meta = {
    description = "GPS messages for use in GPS drivers";
  };
})
