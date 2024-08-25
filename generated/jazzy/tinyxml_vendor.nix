{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  tinyxml,
}:
let
  sources = rec {
    tinyxml_vendor = substituteSource {
      src = fetchgit {
        name = "tinyxml_vendor-source";
        url = "https://github.com/ros2-gbp/tinyxml_vendor-release.git";
        rev = "d8b6f008b165ed9bca9410f49ca500a2c865933e";
        hash = "sha256-dUN/DADvU7TSwxQ/YcI/RcFlAYZ5JLYHb+TNOCpoO7k=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://downloads.sourceforge.net/project/tinyxml/tinyxml/2.6.2/tinyxml_2_6_2.tar.gz";
          to = "URL ${tinyxml_vendor-vendor_source-tinyxml_2_6_2-0}";
        }
      ];
    };
    tinyxml_vendor-vendor_source-tinyxml_2_6_2-0 = substituteSource {
      src = fetchzip {
        name = "tinyxml_vendor-vendor_source-tinyxml_2_6_2-0-source";
        url = "https://downloads.sourceforge.net/project/tinyxml/tinyxml/2.6.2/tinyxml_2_6_2.tar.gz";
        hash = "sha256-nYksyFj8nzE1IS8vKoqxI0zVpqgfieWHMU7Ke6C5oY0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tinyxml_vendor";
  version = "0.10.0-3";
  src = sources.tinyxml_vendor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ tinyxml ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "CMake shim over the tinxml library.";
  };
}
