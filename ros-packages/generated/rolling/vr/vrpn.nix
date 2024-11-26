{
  ament-cmake,
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "vrpn";
  version = "7.35.0-20";
  src = finalAttrs.passthru.sources."vrpn";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake ];
  passthru = {
    sources = mkSourceSet (sources: {
      "vrpn" = substituteSource {
        src = fetchgit {
          name = "vrpn-source";
          url = "https://github.com/ros2-gbp/vrpn-release.git";
          rev = "358301cb68d6b50ecb00e64c22c69a6021ba0900";
          hash = "sha256-2oOc4KpLGkfRc8tNDvM7xxjiHahtaoa5tGYhQEA7ViA=";
        };
      };
    });
  };
  meta = {
    description = "The VRPN is a library and set of servers that interfaces with virtual-reality systems, such as VICON, OptiTrack, and others.";
  };
})
