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
  version = "0.11.2-1";
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
        rev = "d6d0f7ef516c8389d07eb3e10dcee12b5b52200d";
        hash = "sha256-qlCphSrgesY5eD8uRuGZbY/tcWy1NEkQeAhsdhjscEA=";
      };
    };
  });
  meta = {
    description = "\n    Wrapper around tinyxml2, providing nothing but a dependency on tinyxml2, on some systems.\n    On others, it provides a fixed CMake module or even an ExternalProject build of tinyxml2.\n  ";
  };
})
