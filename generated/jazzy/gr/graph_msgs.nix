{
  ament_cmake,
  ament_lint_auto,
  ament_lint_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    graph_msgs-cb9838e309f09242d2ccef5878756aa50588a063 = substituteSource {
      src = fetchgit {
        name = "graph_msgs-cb9838e309f09242d2ccef5878756aa50588a063-source";
        url = "https://github.com/ros2-gbp/graph_msgs-release.git";
        rev = "cb9838e309f09242d2ccef5878756aa50588a063";
        hash = "sha256-Zs/vEflqm3Ft6PVC5rmE7JAj2pPFja8QAhBxSsH93dg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "graph_msgs";
  version = "0.2.0-6";
  src = sources.graph_msgs-cb9838e309f09242d2ccef5878756aa50588a063;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS messages for publishing graphs of different data types";
  };
}
