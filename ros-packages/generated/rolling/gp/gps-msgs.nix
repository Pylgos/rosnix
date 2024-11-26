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
  version = "2.0.4-1";
  src = finalAttrs.passthru.sources."gps_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "gps_msgs" = substituteSource {
        src = fetchgit {
          name = "gps_msgs-source";
          url = "https://github.com/ros2-gbp/gps_umd-release.git";
          rev = "c17dcb52a7de94f186a5b4f91d87a9150ab67324";
          hash = "sha256-+QdXAKoETYEVPixEE9cGbmi8yFtZl1SItOQI9/n3qFI=";
        };
      };
    });
  };
  meta = {
    description = "GPS messages for use in GPS drivers";
  };
})
