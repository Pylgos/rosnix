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
    graph_msgs-f4120aae7ca5141b367d82bb42066f4b7e2bc321 = substituteSource {
      src = fetchgit {
        name = "graph_msgs-f4120aae7ca5141b367d82bb42066f4b7e2bc321-source";
        url = "https://github.com/ros2-gbp/graph_msgs-release.git";
        rev = "f4120aae7ca5141b367d82bb42066f4b7e2bc321";
        hash = "sha256-Zs/vEflqm3Ft6PVC5rmE7JAj2pPFja8QAhBxSsH93dg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "graph_msgs";
  version = "0.2.0-5";
  src = sources.graph_msgs-f4120aae7ca5141b367d82bb42066f4b7e2bc321;
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
