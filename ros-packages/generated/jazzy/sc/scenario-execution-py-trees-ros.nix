{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  py-trees-ros,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "scenario_execution_py_trees_ros";
  version = "1.2.0-5";
  src = finalAttrs.passthru.sources."scenario_execution_py_trees_ros";
  propagatedBuildInputs = [ py-trees-ros ];
  passthru.sources = mkSourceSet (sources: {
    "scenario_execution_py_trees_ros" = substituteSource {
      src = fetchgit {
        name = "scenario_execution_py_trees_ros-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "4933518602d491a622899bcd48d5cc2e0c0ab77f";
        hash = "sha256-Rv5V2I6jT4HlCQ/6JSUAKQ8b1RSlmXGYA1ie+y+I4M8=";
      };
    };
  });
  meta = {
    description = "Fixes in py-trees-ros not yet release";
  };
})
