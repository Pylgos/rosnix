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
  version = "0.3.1-1";
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
        rev = "86cf5e1f0c27fdd0a2ea408586d7120229d2653e";
        hash = "sha256-GCYtn784AvW/q2zgyt/Y1FFSKQUyPO0Y/3vNDpMNjQA=";
      };
    };
  });
  meta = {
    description = "Meta-package aggregating the ros2_canopen packages and documentation";
  };
})
