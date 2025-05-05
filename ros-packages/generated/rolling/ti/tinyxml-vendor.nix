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
  pname = "tinyxml_vendor";
  version = "0.10.0-2";
  src = finalAttrs.passthru.sources."tinyxml_vendor";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "tinyxml" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "tinyxml" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tinyxml_vendor" = substituteSource {
      src = fetchgit {
        name = "tinyxml_vendor-source";
        url = "https://github.com/ros2-gbp/tinyxml_vendor-release.git";
        rev = "4cbcecd115ec88b00e7c32213a5579466b607da0";
        hash = "sha256-dUN/DADvU7TSwxQ/YcI/RcFlAYZ5JLYHb+TNOCpoO7k=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://downloads.sourceforge.net/project/tinyxml/tinyxml/2.6.2/tinyxml_2_6_2.tar.gz";
          to = "URL ${sources."tinyxml_vendor/tinyxml_2_6_2"}";
        }
      ];
    };
    "tinyxml_vendor/tinyxml_2_6_2" = substituteSource {
      src = fetchzip {
        name = "tinyxml_2_6_2-source";
        url = "https://downloads.sourceforge.net/project/tinyxml/tinyxml/2.6.2/tinyxml_2_6_2.tar.gz";
        hash = "sha256-nYksyFj8nzE1IS8vKoqxI0zVpqgfieWHMU7Ke6C5oY0=";
      };
    };
  });
  meta = {
    description = "CMake shim over the tinxml library.";
  };
})
