{
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
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
  pname = "husarion_ugv_msgs";
  version = "2.3.1-1";
  src = finalAttrs.passthru.sources."husarion_ugv_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "husarion_ugv_msgs" = substituteSource {
      src = fetchgit {
        name = "husarion_ugv_msgs-source";
        url = "https://github.com/ros2-gbp/husarion_ugv_ros-release.git";
        rev = "da3c1ccea7bcb212b4c9e09ef1241862995c961d";
        hash = "sha256-Shxd8T1qOj+/+QM0HbqLeOIbgDHvy/7JnBhZCIcGtuw=";
      };
    };
  });
  meta = {
    description = "Custom messages for Husarion UGV";
  };
})
