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
  version = "2.1.1-1";
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
        rev = "8345747a27d0058e583379fbc3eea9fca79b11da";
        hash = "sha256-K3Duvbc6Og3Xdryy3KACeOLxEXmW/vNbbW/ck67pDJw=";
      };
    };
  });
  meta = {
    description = "GPS messages for use in GPS drivers";
  };
})
