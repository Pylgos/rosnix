{
  ament_cmake,
  ament_cmake_copyright,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_cmake,
  buildRosPackage,
  console_bridge_vendor,
  eigen3_cmake_module,
  eigen_stl_containers,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  mkSourceSet,
  random_numbers,
  rclcpp,
  resource_retriever,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  shape_msgs,
  substituteSource,
  visualization_msgs,
}:
let
  sources = mkSourceSet (sources: {
    "geometric_shapes" = substituteSource {
      src = fetchgit {
        name = "geometric_shapes-source";
        url = "https://github.com/ros2-gbp/geometric_shapes-release.git";
        rev = "96327540c29c53b84b4d769295d2d3bfabb46144";
        hash = "sha256-o2Eck5v0SgZlsbOmbpf5qikEjkjDqv/wJ2kTdTiq2RQ=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "geometric_shapes";
  version = "2.2.1-1";
  src = sources."geometric_shapes";
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ eigen3_cmake_module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ console_bridge_vendor eigen_stl_containers geometry_msgs random_numbers rclcpp resource_retriever rosidl_default_runtime shape_msgs visualization_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp" "assimp-dev" "eigen" "libboost-dev" "libboost-filesystem" "libboost-filesystem-dev" "liboctomap-dev" "libqhull" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_copyright ament_cmake_gtest ament_lint_auto ament_lint_cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "This package contains generic definitions of geometric shapes and bodies.";
  };
}
