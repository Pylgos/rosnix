{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tinyxml2_vendor";
  version = "0.10.0-1";
  src = finalAttrs.passthru.sources."tinyxml2_vendor";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "tinyxml2" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tinyxml2_vendor" = substituteSource {
      src = fetchgit {
        name = "tinyxml2_vendor-source";
        url = "https://github.com/ros2-gbp/tinyxml2_vendor-release.git";
        rev = "141f943e8a56d4445d631696658690d2fe25c311";
        hash = "sha256-JcopBYS3JtmhMOyufT16RtNIUMAMMn7/mt00AcXLyXs=";
      };
    };
  });
  meta = {
    description = "Wrapper around tinyxml2, providing nothing but a dependency on tinyxml2, on some systems. On others, it provides a fixed CMake module or even an ExternalProject build of tinyxml2.";
  };
})
