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
  pname = "marine_acoustic_msgs";
  version = "2.1.0-2";
  src = finalAttrs.passthru.sources."marine_acoustic_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ geometry-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "marine_acoustic_msgs" = substituteSource {
      src = fetchgit {
        name = "marine_acoustic_msgs-source";
        url = "https://github.com/ros2-gbp/marine_msgs-release.git";
        rev = "2accedcdf1b48bdcbf7a91bf9e33f19a9deebd79";
        hash = "sha256-ALbjKiPGNTichMtqbwwJIA4Y52MYdCELmDl3tLU3dC4=";
      };
    };
  });
  meta = {
    description = "The marine_acoustic_msgs package, including messages for common\n  underwater sensors (DVL, multibeam sonar, imaging sonar)\n  ";
  };
})
