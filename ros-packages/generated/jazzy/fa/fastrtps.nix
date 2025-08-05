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
  pname = "fastrtps";
  version = "2.14.5-2";
  src = finalAttrs.passthru.sources."fastrtps";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ fastcdr foonathan-memory-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "asio" "libssl-dev" "python3" "tinyxml2" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ fastcdr foonathan-memory-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "asio" "libssl-dev" "python3" "tinyxml2" ]; };
  passthru.sources = mkSourceSet (sources: {
    "fastrtps" = substituteSource {
      src = fetchgit {
        name = "fastrtps-source";
        url = "https://github.com/ros2-gbp/fastdds-release.git";
        rev = "969ab7d1c1999f7807d9a8538e81e4fa70a7d6e2";
        hash = "sha256-M8hCLCxAjqstt4iNL0wv2mlC5FYnLNNk0DrEp5izDHQ=";
      };
    };
  });
  meta = {
    description = "\n     *eprosima Fast DDS* (formerly Fast RTPS) is a C++ implementation of the DDS (Data Distribution Service) standard of the OMG (Object Management Group). eProsima Fast DDS implements the RTPS (Real Time Publish Subscribe) protocol, which provides publisher-subscriber communications over unreliable transports such as UDP, as defined and maintained by the Object Management Group (OMG) consortium. RTPS is also the wire interoperability protocol defined for the Data Distribution Service (DDS) standard. *eProsima Fast DDS* expose an API to access directly the RTPS protocol, giving the user full access to the protocol internals.\n  ";
  };
})
