{
  buildCmakePackage,
  fastcdr,
  fetchgit,
  fetchurl,
  fetchzip,
  foonathan-memory-vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "fastdds";
  version = "3.4.1-1";
  src = finalAttrs.passthru.sources."fastdds";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ fastcdr foonathan-memory-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "asio" "libssl-dev" "python3" "tinyxml2" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ fastcdr foonathan-memory-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "asio" "libssl-dev" "python3" "tinyxml2" ]; };
  passthru.sources = mkSourceSet (sources: {
    "fastdds" = substituteSource {
      src = fetchgit {
        name = "fastdds-source";
        url = "https://github.com/ros2-gbp/fastdds-release.git";
        rev = "5b3cf809dc8233976e38f80f1810d476d7387864";
        hash = "sha256-D06PlZzuWdn7sVZ0m01ObVr5tFkBFpOap6PkaCo1gQE=";
      };
    };
  });
  meta = {
    description = "\n  eProsima Fast DDS is a C++ implementation of the DDS (Data Distribution Service) standard of the OMG (Object Management Group). eProsima Fast DDS implements the RTPS (Real Time Publish Subscribe) protocol, which provides publisher-subscriber communications over unreliable transports such as UDP, as defined and maintained by the Object Management Group (OMG) consortium. RTPS is also the wire interoperability protocol defined for the Data Distribution Service (DDS) standard. eProsima Fast DDS expose an API to access directly the RTPS protocol, giving the user full access to the protocol internals.\n  ";
  };
})
