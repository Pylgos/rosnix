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
  pname = "ardrone_sdk";
  version = "2.0.3-1";
  src = finalAttrs.passthru.sources."ardrone_sdk";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "ffmpeg" "libavahi-client-dev" "libjson-c-dev" "libncurses-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "ffmpeg" "libavahi-client-dev" "libjson-c-dev" "libncurses-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ardrone_sdk" = substituteSource {
      src = fetchgit {
        name = "ardrone_sdk-source";
        url = "https://github.com/ros2-gbp/ardrone_ros-release.git";
        rev = "abebdeeaabb05371970252d878e5fecaf2ba7ff6";
        hash = "sha256-gPoCimHc2uERHbR1E3K/wSP26wCLrJAlfDnEMTiXk7M=";
      };
    };
  });
  meta = {
    description = "Exports ARSDK3 as a library";
  };
})
