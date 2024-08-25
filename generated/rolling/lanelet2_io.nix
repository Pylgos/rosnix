{
  ament_cmake_core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest,
  lanelet2_core,
  mrt_cmake_modules,
  pugixml,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    lanelet2_io = substituteSource {
      src = fetchgit {
        name = "lanelet2_io-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "38f37dab6a64d5c16ff048611c0a3b4e1bd4d132";
        hash = "sha256-B0AHMNYejPsaUhx0+RpURz56wZfnlpEXWZ/KnhdUuOQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lanelet2_io";
  version = "1.2.1-6";
  src = sources.lanelet2_io;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ mrt_cmake_modules ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lanelet2_core pugixml python3Packages.boost ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ gtest ];
  missingDependencies = [  ];
  meta = {
    description = "Parser/Writer module for lanelet2";
  };
}
