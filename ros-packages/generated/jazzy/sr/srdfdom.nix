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
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  tinyxml2_vendor,
  urdf,
  urdfdom_headers,
  urdfdom_py,
}:
let
  sources = mkSourceSet (sources: {
    "srdfdom" = substituteSource {
      src = fetchgit {
        name = "srdfdom-source";
        url = "https://github.com/ros2-gbp/srdfdom-release.git";
        rev = "6817f4b07d5c39f06de2a713efb0b3264e8cb10c";
        hash = "sha256-4SrjgL5tauV2LvLisilSnXwyD2qTdhVdYDtH8D/69yg=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "srdfdom";
  version = "2.0.4-4";
  src = sources."srdfdom";
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