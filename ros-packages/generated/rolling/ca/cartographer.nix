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
  version = "2.0.9004-2";
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
        rev = "1775a17518aa39f35cb407e17353f9424f94fa3b";
        hash = "sha256-5Fpxk9cgU76BjWQZBglBLGWJvE3K3Noqtz6erFAfunE=";
      };
    };
  });
  meta = {
    description = "\n    Cartographer is a system that provides real-time simultaneous localization\n    and mapping (SLAM) in 2D and 3D across multiple platforms and sensor\n    configurations.\n  ";
  };
})
