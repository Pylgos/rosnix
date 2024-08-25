{
  ament_cmake_core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest,
  lanelet2_core,
  lanelet2_io,
  lanelet2_matching,
  lanelet2_projection,
  lanelet2_routing,
  lanelet2_traffic_rules,
  mrt_cmake_modules,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    lanelet2_python = substituteSource {
      src = fetchgit {
        name = "lanelet2_python-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "8f7f3a7499f36c1f4bd7508fb88d4593b432b251";
        hash = "sha256-ShlQQ/+8TBL3/8PE/BeVaLtJW5l2B8FQO8eY06yg5Lc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lanelet2_python";
  version = "1.2.1-6";
  src = sources.lanelet2_python;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ mrt_cmake_modules ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lanelet2_core lanelet2_io lanelet2_matching lanelet2_projection lanelet2_routing lanelet2_traffic_rules python3Packages.boost ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ gtest ];
  missingDependencies = [  ];
  meta = {
    description = "Python bindings for lanelet2";
  };
}
