{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_cmake,
  buildRosPackage,
  console_bridge_vendor,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
  tinyxml2_vendor,
  urdf,
  urdfdom_headers,
  urdfdom_py,
}:
let
  sources = rec {
    srdfdom-631a38d245e6b93126aaa6377f6950b9df4d807a = substituteSource {
      src = fetchgit {
        name = "srdfdom-631a38d245e6b93126aaa6377f6950b9df4d807a-source";
        url = "https://github.com/ros2-gbp/srdfdom-release.git";
        rev = "631a38d245e6b93126aaa6377f6950b9df4d807a";
        hash = "sha256-4SrjgL5tauV2LvLisilSnXwyD2qTdhVdYDtH8D/69yg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "srdfdom";
  version = "2.0.4-3";
  src = sources.srdfdom-631a38d245e6b93126aaa6377f6950b9df4d807a;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ console_bridge_vendor tinyxml2_vendor urdf urdfdom_headers urdfdom_py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-dev" "libconsole-bridge-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Parser for Semantic Robot Description Format (SRDF).";
  };
}
