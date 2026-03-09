{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbot_bringup";
  version = "0.18.6-1";
  src = finalAttrs.passthru.sources."rosbot_bringup";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "rosbot_bringup" = substituteSource {
      src = fetchgit {
        name = "rosbot_bringup-source";
        url = "https://github.com/ros2-gbp/rosbot_ros-release.git";
        rev = "1986a5d994a01e3dd62f7d3ebbfe4e3d2cec7acd";
        hash = "sha256-7lcHzOGaI25ks8yhnjC3qxIw3TUFfV6+pwva2k2zBOQ=";
      };
    };
  });
  meta = {
    description = "ROSbot Series bringup package";
  };
})
