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
  pname = "phidgets_msgs";
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."phidgets_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "phidgets_msgs" = substituteSource {
      src = fetchgit {
        name = "phidgets_msgs-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "1f1f9dbc21cd757b633286d60b8891a550a835b4";
        hash = "sha256-60nKYhcT9m7l03NmbXFrFccilzWMPfkLCXh+QKIVUzw=";
      };
    };
  });
  meta = {
    description = "Custom ROS messages for Phidgets drivers";
  };
})
