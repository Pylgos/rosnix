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
  version = "2.1.2-1";
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
        rev = "9d5a94bc4d18714d16d604e58f2bb330531ff860";
        hash = "sha256-td6SdwylYHtaPdDfeeS0/DXHpWdUwfUSJY4fKoiWqb8=";
      };
    };
  });
  meta = {
    description = "GPS messages for use in GPS drivers";
  };
})
