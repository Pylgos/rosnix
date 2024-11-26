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
  pname = "ament_download";
  version = "0.0.5-5";
  src = finalAttrs.passthru.sources."ament_download";
  nativeBuildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ament_download" = substituteSource {
      src = fetchgit {
        name = "ament_download-source";
        url = "https://github.com/ros2-gbp/ament_download-release.git";
        rev = "ed8a03857e6995f4b54e7bcf8a02333a14811f80";
        hash = "sha256-6V9DhJraMIbNz3xeSeczpOFyaWgBqKsz2vQV4jFl6qk=";
      };
    };
  });
  meta = {
    description = "CMake macros for downloading files with ament";
  };
})
