{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  py-trees-ros,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "scenario_execution_py_trees_ros" = substituteSource {
      src = fetchgit {
        name = "scenario_execution_py_trees_ros-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "8daacc00cfecd5ea70ebb8f47dc8ebfc1a4d3d41";
        hash = "sha256-Rv5V2I6jT4HlCQ/6JSUAKQ8b1RSlmXGYA1ie+y+I4M8=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage (finalAttrs: {
  pname = "scenario_execution_py_trees_ros";
  version = "1.2.0-4";
  src = finalAttrs.passthru.sources."scenario_execution_py_trees_ros";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ py-trees-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Fixes in py-trees-ros not yet release";
  };
})
