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
  version = "0.10.0-2";
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
        rev = "16864c700f76f223143bec2619adb2792c59cb5b";
        hash = "sha256-JcopBYS3JtmhMOyufT16RtNIUMAMMn7/mt00AcXLyXs=";
      };
    };
  });
  meta = {
    description = "\n    Wrapper around tinyxml2, providing nothing but a dependency on tinyxml2, on some systems.\n    On others, it provides a fixed CMake module or even an ExternalProject build of tinyxml2.\n  ";
  };
})
