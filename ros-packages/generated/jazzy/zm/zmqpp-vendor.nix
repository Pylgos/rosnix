{
  ament-cmake,
  ament-cmake-vendor-package,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "zmqpp_vendor";
  version = "0.1.0-1";
  src = finalAttrs.passthru.sources."zmqpp_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "libzmq3-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "git" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libzmq3-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "zmqpp_vendor" = substituteSource {
      src = fetchgit {
        name = "zmqpp_vendor-source";
        url = "https://github.com/ros2-gbp/zmqpp_vendor-release.git";
        rev = "a60d2dd0510958e57339d4341b32b07cae880336";
        hash = "sha256-y7Kq1Vlu/Xbyr7gUJFPkqQZSfxShbpuusFYMTZjfxaY=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/zeromq/zmqpp.git";
          to = "VCS_TYPE path VCS_URL ${sources."zmqpp_vendor/zmqpp"}";
        }
      ];
    };
    "zmqpp_vendor/zmqpp" = substituteSource {
      src = fetchgit {
        name = "zmqpp-source";
        url = "https://github.com/zeromq/zmqpp.git";
        rev = "da73a138f290274cfd604b3f05a908956390a66e";
        hash = "sha256-UZyJpBEOf/Ys+i2tiBTjv4PlM5fHjjNLWuGhpgcmYyM=";
      };
    };
  });
  meta = {
    description = "Vendor package for zmqpp";
  };
})
