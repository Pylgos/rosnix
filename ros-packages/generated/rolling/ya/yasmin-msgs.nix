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
  version = "4.2.4-1";
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
        rev = "86b76689d02e35a370f0b4f534d1dfd298dcbfb7";
        hash = "sha256-4SrVx9Qw4TOjv7SYLgGWL0fM6yH0SQaytyncH2tCCkY=";
      };
    };
  });
  meta = {
    description = "Msgs of (Yet Another State MachINe)";
  };
})
