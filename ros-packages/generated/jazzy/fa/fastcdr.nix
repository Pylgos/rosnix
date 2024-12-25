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
  version = "2.2.5-1";
  src = finalAttrs.passthru.sources."fastcdr";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  checkInputs = [ ament-cmake ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "fastcdr" = substituteSource {
      src = fetchgit {
        name = "fastcdr-source";
        url = "https://github.com/ros2-gbp/fastcdr-release.git";
        rev = "aa26ea95c0cabd2d900b8e10689fa0923be451ad";
        hash = "sha256-wTGrT62QGztWWhxi1XrVV1HvTXUV84HVitNDZKzIREE=";
      };
    };
  });
  meta = {
    description = "*eProsima Fast CDR* is a C++ serialization library implementing the Common Data Representation (CDR) mechanism defined by the Object Management Group (OMG) consortium. CDR is the serialization mechanism used in DDS for the DDS Interoperability Wire Protocol (DDSI-RTPS).";
  };
})
