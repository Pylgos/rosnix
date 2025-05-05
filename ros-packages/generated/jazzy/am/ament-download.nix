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
  version = "0.0.5-6";
  src = finalAttrs.passthru.sources."ament_download";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ament_download" = substituteSource {
      src = fetchgit {
        name = "ament_download-source";
        url = "https://github.com/ros2-gbp/ament_download-release.git";
        rev = "6ce6469292c63e6bc20f3e38a9062b0a027f92e4";
        hash = "sha256-6V9DhJraMIbNz3xeSeczpOFyaWgBqKsz2vQV4jFl6qk=";
      };
    };
  });
  meta = {
    description = "CMake macros for downloading files with ament";
  };
})
