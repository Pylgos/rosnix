{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "yasmin_msgs";
  version = "4.2.3-1";
  src = finalAttrs.passthru.sources."yasmin_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators ];
  passthru.sources = mkSourceSet (sources: {
    "yasmin_msgs" = substituteSource {
      src = fetchgit {
        name = "yasmin_msgs-source";
        url = "https://github.com/ros2-gbp/yasmin-release.git";
        rev = "64805d643c215dbdeb2f758546489011c6c705c5";
        hash = "sha256-jJX1+jgi4BenFGw117dX1UcZlqQn77R1BKlXwQH5dUQ=";
      };
    };
  });
  meta = {
    description = "Msgs of (Yet Another State MachINe)";
  };
})
