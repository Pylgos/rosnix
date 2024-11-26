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
  version = "2.14.3-1";
  src = finalAttrs.passthru.sources."fastrtps";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ fastcdr foonathan-memory-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "asio" "libssl-dev" "python3" "tinyxml2" ]; };
  passthru.sources = mkSourceSet (sources: {
    "fastrtps" = substituteSource {
      src = fetchgit {
        name = "fastrtps-source";
        url = "https://github.com/ros2-gbp/fastrtps-release.git";
        rev = "9d6f48dc2ecfe0bc33d20f96717755d11826616f";
        hash = "sha256-KSSHJqNx1mzl93n+QLasqWT2+NllPGG82pdzSM97uh4=";
      };
    };
  });
  meta = {
    description = "*eprosima Fast DDS* (formerly Fast RTPS) is a C++ implementation of the DDS (Data Distribution Service) standard of the OMG (Object Management Group). eProsima Fast DDS implements the RTPS (Real Time Publish Subscribe) protocol, which provides publisher-subscriber communications over unreliable transports such as UDP, as defined and maintained by the Object Management Group (OMG) consortium. RTPS is also the wire interoperability protocol defined for the Data Distribution Service (DDS) standard. *eProsima Fast DDS* expose an API to access directly the RTPS protocol, giving the user full access to the protocol internals.";
  };
})
