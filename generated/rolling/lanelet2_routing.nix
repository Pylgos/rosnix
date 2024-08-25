{
  ament_cmake_core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest,
  lanelet2_core,
  lanelet2_traffic_rules,
  mrt_cmake_modules,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    lanelet2_routing = substituteSource {
      src = fetchgit {
        name = "lanelet2_routing-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "40b695e5e8e5ae3a15b85c2fc6d5808b0fea47e4";
        hash = "sha256-nGVDdE1W8o7u9mMs1LHE5cT4A9mFdBo3NEHLB0QeZqE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lanelet2_routing";
  version = "1.2.1-6";
  src = sources.lanelet2_routing;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ mrt_cmake_modules ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lanelet2_core lanelet2_traffic_rules python3Packages.boost ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ gtest ];
  missingDependencies = [  ];
  meta = {
    description = "Routing module for lanelet2";
  };
}
