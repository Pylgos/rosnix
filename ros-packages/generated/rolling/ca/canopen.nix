{
  ament-cmake,
  buildAmentCmakePackage,
  canopen-402-driver,
  canopen-base-driver,
  canopen-core,
  canopen-interfaces,
  canopen-proxy-driver,
  fetchgit,
  fetchurl,
  fetchzip,
  lely-core-libraries,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "canopen";
  version = "0.2.12-2";
  src = finalAttrs.passthru.sources."canopen";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ canopen-402-driver canopen-base-driver canopen-core canopen-interfaces canopen-proxy-driver lely-core-libraries ];
  passthru.sources = mkSourceSet (sources: {
    "canopen" = substituteSource {
      src = fetchgit {
        name = "canopen-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "2295c5b5328ef7bb5ac8f10f956390d9fd405e80";
        hash = "sha256-sm7FaP2yTmcMeJhV7bqSBuDjGyDXyxt3MwaxCUyoi1s=";
      };
    };
  });
  meta = {
    description = "Meta-package aggregating the ros2_canopen packages and documentation";
  };
})
