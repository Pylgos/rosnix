{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "rc_genicam_api";
  version = "2.6.5-1";
  src = finalAttrs.passthru.sources."rc_genicam_api";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libncurses-dev" "libpng-dev" "libusb-1.0" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rc_genicam_api" = substituteSource {
      src = fetchgit {
        name = "rc_genicam_api-source";
        url = "https://github.com/ros2-gbp/rc_genicam_api-release.git";
        rev = "71681af0a8b4ba1871e5da13cfe4208ed92394e4";
        hash = "sha256-MadM+JVLeVj6ATzpAl5cZN5+iBRhVXF4yg1qwk7tHRA=";
      };
    };
  });
  meta = {
    description = "GenICam/GigE Vision Convenience Layer. This package combines the Roboception convenience layer for images with the GenICam reference implementation and a GigE Vision transport layer. It is a self contained package that permits configuration and image streaming of GenICam / GigE Vision 2.0 compatible cameras like the Roboception rc_visard. This package also provides some tools that can be called from the command line for discovering cameras, changing their configuration and streaming images. Although the tools are meant to be useful when working in a shell or in a script, their main purpose is to serve as example on how to use the API for reading and setting parameters, streaming and synchronizing images. See LICENSE.md for licensing terms of the different parts.";
  };
})
