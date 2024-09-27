{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    rc_genicam_api-57bf6c445677c596d425b929c0f82266f98c1cda = substituteSource {
      src = fetchgit {
        name = "rc_genicam_api-57bf6c445677c596d425b929c0f82266f98c1cda-source";
        url = "https://github.com/ros2-gbp/rc_genicam_api-release.git";
        rev = "57bf6c445677c596d425b929c0f82266f98c1cda";
        hash = "sha256-bp8a9UBIdmzBsLXwZO86DD8/PxRp2Bl0HRWOS+fWgOg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rc_genicam_api";
  version = "2.6.5-2";
  src = sources.rc_genicam_api-57bf6c445677c596d425b929c0f82266f98c1cda;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libncurses-dev" "libpng-dev" "libusb-1.0" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "GenICam/GigE Vision Convenience Layer. This package combines the Roboception convenience layer for images with the GenICam reference implementation and a GigE Vision transport layer. It is a self contained package that permits configuration and image streaming of GenICam / GigE Vision 2.0 compatible cameras like the Roboception rc_visard. This package also provides some tools that can be called from the command line for discovering cameras, changing their configuration and streaming images. Although the tools are meant to be useful when working in a shell or in a script, their main purpose is to serve as example on how to use the API for reading and setting parameters, streaming and synchronizing images. See LICENSE.md for licensing terms of the different parts.";
  };
}
