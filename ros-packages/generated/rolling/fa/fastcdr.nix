{
  ament-cmake,
  ament-cmake-gtest,
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "fastcdr";
  version = "2.3.0-1";
  src = finalAttrs.passthru.sources."fastcdr";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  checkInputs = [ ament-cmake ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "fastcdr" = substituteSource {
      src = fetchgit {
        name = "fastcdr-source";
        url = "https://github.com/ros2-gbp/fastcdr-release.git";
        rev = "4f157dd3266e9f92e2134f27b330a1b9cd774ab9";
        hash = "sha256-5Nf+J6wucW6weGFFEkrIC6Mq7GLSFUNiLD21Ir9M+EY=";
      };
    };
  });
  meta = {
    description = "*eProsima Fast CDR* is a C++ serialization library implementing the Common Data Representation (CDR) mechanism defined by the Object Management Group (OMG) consortium. CDR is the serialization mechanism used in DDS for the DDS Interoperability Wire Protocol (DDSI-RTPS).";
  };
})
