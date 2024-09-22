{
  ament_cmake_catch2,
  ament_cmake_uncrustify,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    rmf_utils = substituteSource {
      src = fetchgit {
        name = "rmf_utils-source";
        url = "https://github.com/ros2-gbp/rmf_utils-release.git";
        rev = "b2d4278fa266a69fc67541c312a63c564ba7c76b";
        hash = "sha256-HLMPR4URpPvTGbv5K1BOi9vXURKEkU23kbIAnYHNMaA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_utils";
  version = "1.7.0-1";
  src = sources.rmf_utils;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_catch2 ament_cmake_uncrustify ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Simple C++ programming utilities used by Robotics Middleware Framework packages";
  };
}
