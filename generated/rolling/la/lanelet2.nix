{
  ament_cmake_core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lanelet2_core,
  lanelet2_examples,
  lanelet2_io,
  lanelet2_maps,
  lanelet2_matching,
  lanelet2_projection,
  lanelet2_python,
  lanelet2_routing,
  lanelet2_traffic_rules,
  lanelet2_validation,
  rosSystemPackages,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    lanelet2-77dec70b3711c67d92c6473f2b33cf635e64d996 = substituteSource {
      src = fetchgit {
        name = "lanelet2-77dec70b3711c67d92c6473f2b33cf635e64d996-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "77dec70b3711c67d92c6473f2b33cf635e64d996";
        hash = "sha256-AzSwj7wfb5mwc935jTjea1QB6+8BRLtOJyhJlWiBoLM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lanelet2";
  version = "1.2.1-6";
  src = sources.lanelet2-77dec70b3711c67d92c6473f2b33cf635e64d996;
  nativeBuildInputs = [ ament_cmake_core ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ lanelet2_core lanelet2_examples lanelet2_io lanelet2_maps lanelet2_matching lanelet2_projection lanelet2_python lanelet2_routing lanelet2_traffic_rules lanelet2_validation ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Meta-package for lanelet2";
  };
}
