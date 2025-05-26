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
  version = "2.0.9004-1";
  src = finalAttrs.passthru.sources."cartographer";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "git" "google-mock" "gtest" "libabsl-dev" "libboost-iostreams-dev" "libcairo2-dev" "libceres-dev" "libgflags-dev" "libgoogle-glog-dev" "lua5.2-dev" "protobuf-dev" "python3-sphinx" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "git" "google-mock" "gtest" "libabsl-dev" "libboost-iostreams-dev" "libcairo2-dev" "libceres-dev" "libgflags-dev" "libgoogle-glog-dev" "lua5.2-dev" "protobuf-dev" "python3-sphinx" ]; };
  passthru.sources = mkSourceSet (sources: {
    "cartographer" = substituteSource {
      src = fetchgit {
        name = "cartographer-source";
        url = "https://github.com/ros2-gbp/cartographer-release.git";
        rev = "0a6c1d8ea05cd35eeea040691bc87b54700570f6";
        hash = "sha256-5Fpxk9cgU76BjWQZBglBLGWJvE3K3Noqtz6erFAfunE=";
      };
    };
  });
  meta = {
    description = "\n    Cartographer is a system that provides real-time simultaneous localization\n    and mapping (SLAM) in 2D and 3D across multiple platforms and sensor\n    configurations.\n  ";
  };
})
