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
  version = "2.3.5-2";
  src = finalAttrs.passthru.sources."fastcdr";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  checkInputs = [ ament-cmake ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "fastcdr" = substituteSource {
      src = fetchgit {
        name = "fastcdr-source";
        url = "https://github.com/ros2-gbp/fastcdr-release.git";
        rev = "6741033702281b2c6cb1a69f42b506fe2fe0ced5";
        hash = "sha256-5Uq4Jtylas75wjgySCdVxY5fqkJLrNtgCTjQOUeTXF8=";
      };
    };
  });
  meta = {
    description = "\n    *eProsima Fast CDR* is a C++ serialization library implementing the Common Data Representation (CDR) mechanism defined by the Object Management Group (OMG) consortium. CDR is the serialization mechanism used in DDS for the DDS Interoperability Wire Protocol (DDSI-RTPS).\n  ";
  };
})
