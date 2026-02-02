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
  version = "1.3.11-1";
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
        rev = "96f597651fcf2b637e8e06c9599e6f4194a4c21c";
        hash = "sha256-1ZqsaL35Ah5NZP2FN+oTpy742fx4A+j8zsnjfbvA6ao=";
      };
    };
  });
  meta = {
    description = "Basic message types for two dimensional navigation, extending from geometry_msgs::Pose2D.";
  };
})
