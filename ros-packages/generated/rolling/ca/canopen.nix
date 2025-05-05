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
  version = "0.3.0-1";
  src = finalAttrs.passthru.sources."canopen";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ canopen-402-driver canopen-base-driver canopen-core canopen-interfaces canopen-proxy-driver lely-core-libraries ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ canopen-402-driver canopen-base-driver canopen-core canopen-interfaces canopen-proxy-driver lely-core-libraries ];
  passthru.sources = mkSourceSet (sources: {
    "canopen" = substituteSource {
      src = fetchgit {
        name = "canopen-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "c584a46edb4b22bf27ead5e7ab70afe66cb81ed1";
        hash = "sha256-ibA05rWHEqTDLyzdGb4A8DTYmtjYG75fXGMlvu+gDAo=";
      };
    };
  });
  meta = {
    description = "Meta-package aggregating the ros2_canopen packages and documentation";
  };
})
