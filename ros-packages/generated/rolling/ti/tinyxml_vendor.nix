{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    tinyxml_2_6_2-vendor_source-13d1p6h7pjjf663yb28zm2kdak13n652lbrg44sk37zwb342r2cx = substituteSource {
      src = fetchzip {
        name = "tinyxml_2_6_2-vendor_source-13d1p6h7pjjf663yb28zm2kdak13n652lbrg44sk37zwb342r2cx-source";
        url = "https://downloads.sourceforge.net/project/tinyxml/tinyxml/2.6.2/tinyxml_2_6_2.tar.gz";
        hash = "sha256-nYksyFj8nzE1IS8vKoqxI0zVpqgfieWHMU7Ke6C5oY0=";
      };
      substitutions = [
      ];
    };
    tinyxml_vendor-4cbcecd115ec88b00e7c32213a5579466b607da0 = substituteSource {
      src = fetchgit {
        name = "tinyxml_vendor-4cbcecd115ec88b00e7c32213a5579466b607da0-source";
        url = "https://github.com/ros2-gbp/tinyxml_vendor-release.git";
        rev = "4cbcecd115ec88b00e7c32213a5579466b607da0";
        hash = "sha256-dUN/DADvU7TSwxQ/YcI/RcFlAYZ5JLYHb+TNOCpoO7k=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://downloads.sourceforge.net/project/tinyxml/tinyxml/2.6.2/tinyxml_2_6_2.tar.gz";
          to = "URL ${tinyxml_2_6_2-vendor_source-13d1p6h7pjjf663yb28zm2kdak13n652lbrg44sk37zwb342r2cx}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "tinyxml_vendor";
  version = "0.10.0-2";
  src = sources.tinyxml_vendor-4cbcecd115ec88b00e7c32213a5579466b607da0;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "tinyxml" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "CMake shim over the tinxml library.";
  };
}
