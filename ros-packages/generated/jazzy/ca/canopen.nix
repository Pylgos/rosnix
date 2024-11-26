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
  version = "0.2.9-2";
  src = finalAttrs.passthru.sources."canopen";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ canopen-402-driver canopen-base-driver canopen-core canopen-interfaces canopen-proxy-driver lely-core-libraries ];
  passthru = {
    sources = mkSourceSet (sources: {
      "canopen" = substituteSource {
        src = fetchgit {
          name = "canopen-source";
          url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
          rev = "f7ef32f1dd37b628c0f9fc1dc09a07d0367a0a2f";
          hash = "sha256-piA4LMW+Rk9PuHBjbD9oATPlP3AXOEIdCD5BxTH7jEo=";
        };
      };
    });
  };
  meta = {
    description = "Meta-package aggregating the ros2_canopen packages and documentation";
  };
})
