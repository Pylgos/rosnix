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
  pname = "polygon_msgs";
  version = "1.2.0-1";
  src = finalAttrs.passthru.sources."polygon_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "polygon_msgs" = substituteSource {
      src = fetchgit {
        name = "polygon_msgs-source";
        url = "https://github.com/ros2-gbp/polygon_ros-release.git";
        rev = "223ddb1074c2d0ec88a8602d14ed1ad26ccf0299";
        hash = "sha256-2aVAB4KmzNXeuNqOwiKNm+J23O/QZmizEq9SkwvH1sY=";
      };
    };
  });
  meta = {
    description = "General purpose two-dimensional polygons. Formerly a part of nav_2d_msgs";
  };
})
