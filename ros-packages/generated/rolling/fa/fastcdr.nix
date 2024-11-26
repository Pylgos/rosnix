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
  version = "2.2.4-1";
  src = finalAttrs.passthru.sources."fastcdr";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  checkInputs = [ ament-cmake ament-cmake-gtest ];
  passthru = {
    sources = mkSourceSet (sources: {
      "fastcdr" = substituteSource {
        src = fetchgit {
          name = "fastcdr-source";
          url = "https://github.com/ros2-gbp/fastcdr-release.git";
          rev = "02db0eb89caa22d6a3638d86f5d31dcf0d645113";
          hash = "sha256-h7TaahF7NZ1n4w5RhpK2ibHO8g0DNZwDz3omAy6sW9E=";
        };
      };
    });
  };
  meta = {
    description = "*eProsima Fast CDR* is a C++ serialization library implementing the Common Data Representation (CDR) mechanism defined by the Object Management Group (OMG) consortium. CDR is the serialization mechanism used in DDS for the DDS Interoperability Wire Protocol (DDSI-RTPS).";
  };
})
