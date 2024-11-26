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
  pname = "cartographer";
  version = "2.0.9003-1";
  src = finalAttrs.passthru.sources."cartographer";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" "google-mock" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "gtest" "libabsl-dev" "libboost-iostreams-dev" "libcairo2-dev" "libceres-dev" "libgflags-dev" "libgoogle-glog-dev" "lua5.2-dev" "protobuf-dev" "python3-sphinx" ]; };
  passthru.sources = mkSourceSet (sources: {
    "cartographer" = substituteSource {
      src = fetchgit {
        name = "cartographer-source";
        url = "https://github.com/ros2-gbp/cartographer-release.git";
        rev = "1edb1a4891c1ec5d7bdb5064f0d0295390011180";
        hash = "sha256-++Ii26FmyqOYF3zYOPtQ+2ZqNUMomOanyu7Z5uYyu/Y=";
      };
    };
  });
  meta = {
    description = "Cartographer is a system that provides real-time simultaneous localization and mapping (SLAM) in 2D and 3D across multiple platforms and sensor configurations.";
  };
})
