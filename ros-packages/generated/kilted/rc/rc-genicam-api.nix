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
  version = "2.6.5-2";
  src = finalAttrs.passthru.sources."rc_genicam_api";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "libncurses-dev" "libpng-dev" "libusb-1.0" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libncurses-dev" "libpng-dev" "libusb-1.0" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rc_genicam_api" = substituteSource {
      src = fetchgit {
        name = "rc_genicam_api-source";
        url = "https://github.com/ros2-gbp/rc_genicam_api-release.git";
        rev = "7e33367730a5a066b9955671b4a3334a72d1a989";
        hash = "sha256-bp8a9UBIdmzBsLXwZO86DD8/PxRp2Bl0HRWOS+fWgOg=";
      };
    };
  });
  meta = {
    description = "\n      GenICam/GigE Vision Convenience Layer.\n\n      This package combines the Roboception convenience layer for images with the\n      GenICam reference implementation and a GigE Vision transport layer. It is a\n      self contained package that permits configuration and image streaming of\n      GenICam / GigE Vision 2.0 compatible cameras like the Roboception rc_visard.\n\n      This package also provides some tools that can be called from the command line\n      for discovering cameras, changing their configuration and streaming images.\n      Although the tools are meant to be useful when working in a shell or in a\n      script, their main purpose is to serve as example on how to use the API for\n      reading and setting parameters, streaming and synchronizing images.\n\n      See LICENSE.md for licensing terms of the different parts.\n    ";
  };
})
