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
  pname = "protobuf_comm";
  version = "0.9.3-1";
  src = finalAttrs.passthru.sources."protobuf_comm";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-system-dev" "libboost-thread-dev" "openssl" "protobuf-dev" "spdlog" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libboost-system-dev" "libboost-thread-dev" "openssl" "protobuf-dev" "spdlog" ]; };
  passthru.sources = mkSourceSet (sources: {
    "protobuf_comm" = substituteSource {
      src = fetchgit {
        name = "protobuf_comm-source";
        url = "https://github.com/ros2-gbp/protobuf_comm-release.git";
        rev = "687b699f15b10a7de4f8db0ec44aee3b20fa9d68";
        hash = "sha256-WEM/mFiEDIR985ndYnVIVjjHKNY3ysbhoFtqzOFwPRA=";
      };
    };
  });
  meta = {
    description = "Wrapper for protobuf communication using c++";
  };
})
