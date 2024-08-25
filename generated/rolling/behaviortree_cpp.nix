{
  ament_cmake,
  ament_cmake_gtest,
  ament_index_cpp,
  buildRosPackage,
  cppzmq,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  ros_environment,
  sqlite,
  substituteSource,
}:
let
  sources = rec {
    behaviortree_cpp = substituteSource {
      src = fetchgit {
        name = "behaviortree_cpp-source";
        url = "https://github.com/ros2-gbp/behaviortree_cpp_v4-release.git";
        rev = "97fadfef60911ff5e59326f26c684ef1511dd3de";
        hash = "sha256-/wi43gC6qhFEXVP2DkkASIWNXY1t6kLMoiG+KaDm7DY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "behaviortree_cpp";
  version = "4.6.2-1";
  src = sources.behaviortree_cpp;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp cppzmq rclcpp sqlite ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ];
  missingDependencies = [  ];
  meta = {
    description = "This package provides the Behavior Trees core library.";
  };
}
