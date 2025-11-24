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
  version = "0.10.1-1";
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
        rev = "d0b73ff1347f78d4ed2277e10d021bac92fdc8d1";
        hash = "sha256-dCChpeCbLHRwJZ7SY8nEbKG9Vb409+FbQq7lqGBDR28=";
      };
    };
  });
  meta = {
    description = "\n    Wrapper around tinyxml2, providing nothing but a dependency on tinyxml2, on some systems.\n    On others, it provides a fixed CMake module or even an ExternalProject build of tinyxml2.\n  ";
  };
})
