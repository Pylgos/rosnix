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
  version = "0.11.3-2";
  src = finalAttrs.passthru.sources."tinyxml2_vendor";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "tinyxml2" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "tinyxml2" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tinyxml2_vendor" = substituteSource {
      src = fetchgit {
        name = "tinyxml2_vendor-source";
        url = "https://github.com/ros2-gbp/tinyxml2_vendor-release.git";
        rev = "5c9a1c7904811b1d851d5b2eca1f81e075c354ef";
        hash = "sha256-e9iNUBjYIYs8+PiBeXEOjwM3J92iW3rIex9MHAUkYFI=";
      };
    };
  });
  meta = {
    description = "\n    Wrapper around tinyxml2, providing nothing but a dependency on tinyxml2, on some systems.\n    On others, it provides a fixed CMake module or even an ExternalProject build of tinyxml2.\n  ";
  };
})
