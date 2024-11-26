{
  ament-cmake-catch2,
  ament-cmake-uncrustify,
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "rmf_utils";
  version = "1.7.0-1";
  src = finalAttrs.passthru.sources."rmf_utils";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  checkInputs = [ ament-cmake-catch2 ament-cmake-uncrustify ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rmf_utils" = substituteSource {
        src = fetchgit {
          name = "rmf_utils-source";
          url = "https://github.com/ros2-gbp/rmf_utils-release.git";
          rev = "b2d4278fa266a69fc67541c312a63c564ba7c76b";
          hash = "sha256-HLMPR4URpPvTGbv5K1BOi9vXURKEkU23kbIAnYHNMaA=";
        };
      };
    });
  };
  meta = {
    description = "Simple C++ programming utilities used by Robotics Middleware Framework packages";
  };
})
