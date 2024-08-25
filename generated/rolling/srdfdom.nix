{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_cmake,
  buildRosPackage,
  console-bridge,
  console_bridge_vendor,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
  tinyxml2_vendor,
  urdf,
  urdfdom_headers,
  urdfdom_py,
}:
let
  sources = rec {
    srdfdom = substituteSource {
      src = fetchgit {
        name = "srdfdom-source";
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
  src = sources.srdfdom;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ console-bridge console_bridge_vendor python3Packages.boost tinyxml2_vendor urdf urdfdom_headers urdfdom_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_cmake ];
  missingDependencies = [  ];
  meta = {
    description = "Parser for Semantic Robot Description Format (SRDF).";
  };
}
