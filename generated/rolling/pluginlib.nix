{
  ament_cmake,
  ament_cmake_gtest,
  ament_index_cpp,
  buildRosPackage,
  class_loader,
  fetchgit,
  fetchurl,
  fetchzip,
  rcpputils,
  rcutils,
  substituteSource,
  tinyxml2_vendor,
}:
let
  sources = rec {
    pluginlib = substituteSource {
      src = fetchgit {
        name = "pluginlib-source";
        url = "https://github.com/ros2-gbp/pluginlib-release.git";
        rev = "55497a0f479607be3195b6883a6107a38f2f8dfd";
        hash = "sha256-JB5F/PRTfU9jNzXznaDg8QBlh9q79Rg5RISPTHuPTZA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pluginlib";
  version = "5.5.1-1";
  src = sources.pluginlib;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp class_loader rcpputils rcutils tinyxml2_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ];
  missingDependencies = [  ];
  meta = {
    description = "The pluginlib package provides tools for writing and dynamically loading plugins using the ROS build infrastructure. To work, these tools require plugin providers to register their plugins in the package.xml of their package.";
  };
}
