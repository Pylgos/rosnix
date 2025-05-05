{
  ament-cmake,
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
  version = "0.0.2-4";
  src = finalAttrs.passthru.sources."zmqpp_vendor";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "libzmq3-dev" ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "git" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libzmq3-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "zmqpp_vendor" = substituteSource {
      src = fetchgit {
        name = "zmqpp_vendor-source";
        url = "https://github.com/ros2-gbp/zmqpp_vendor-release.git";
        rev = "b0f21543a13623f4155fbfdc7f42b0e8083e6c1b";
        hash = "sha256-OHJpSJAua016kXvKxcD1ay55wprlXnqSL19uzz/el6w=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/zeromq/zmqpp.git";
          to = "URL ${sources."zmqpp_vendor/zmqpp"}";
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
