{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav_2d_msgs";
  version = "1.3.6-1";
  src = finalAttrs.passthru.sources."nav_2d_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "nav_2d_msgs" = substituteSource {
      src = fetchgit {
        name = "nav_2d_msgs-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "739619bb28cd9addb859ab2de7b69a62b70aa9d3";
        hash = "sha256-PMxJFytzDyhQWGpglAaQfHvGaEX9/Yom84xez7n6j98=";
      };
    };
  });
  meta = {
    description = "Basic message types for two dimensional navigation, extending from geometry_msgs::Pose2D.";
  };
})
