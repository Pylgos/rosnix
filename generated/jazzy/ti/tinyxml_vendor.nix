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
    tinyxml_vendor-d8b6f008b165ed9bca9410f49ca500a2c865933e = substituteSource {
      src = fetchgit {
        name = "tinyxml_vendor-d8b6f008b165ed9bca9410f49ca500a2c865933e-source";
        url = "https://github.com/ros2-gbp/tinyxml_vendor-release.git";
        rev = "d8b6f008b165ed9bca9410f49ca500a2c865933e";
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
  version = "0.10.0-3";
  src = sources.tinyxml_vendor-d8b6f008b165ed9bca9410f49ca500a2c865933e;
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
