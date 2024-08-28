{
  ament_cmake,
  ament_cmake_copyright,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_cmake,
  assimp,
  buildRosPackage,
  console_bridge_vendor,
  eigen,
  eigen3_cmake_module,
  eigen_stl_containers,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  pkg-config,
  python3Packages,
  qhull,
  random_numbers,
  rclcpp,
  resource_retriever,
  rosidl_default_generators,
  rosidl_default_runtime,
  shape_msgs,
  substituteSource,
  visualization_msgs,
}:
let
  sources = rec {
    geometric_shapes = substituteSource {
      src = fetchgit {
        name = "geometric_shapes-source";
        url = "https://github.com/ros2-gbp/geometric_shapes-release.git";
        rev = "96327540c29c53b84b4d769295d2d3bfabb46144";
        hash = "sha256-o2Eck5v0SgZlsbOmbpf5qikEjkjDqv/wJ2kTdTiq2RQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "geometric_shapes";
  version = "2.2.1-1";
  src = sources.geometric_shapes;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [ eigen3_cmake_module pkg-config ];
  buildInputs = [  ];
  propagatedBuildInputs = [ assimp console_bridge_vendor eigen eigen_stl_containers geometry_msgs python3Packages.boost qhull random_numbers rclcpp resource_retriever rosidl_default_runtime shape_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_copyright ament_cmake_gtest ament_lint_auto ament_lint_cmake ];
  missingDependencies = [ "liboctomap-dev" ];
  meta = {
    description = "This package contains generic definitions of geometric shapes and bodies.";
  };
}
