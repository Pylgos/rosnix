{
  ament-cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "tinyxml_vendor" = substituteSource {
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
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "tinyxml_vendor";
  version = "0.10.0-3";
  src = sources."tinyxml_vendor";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
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
