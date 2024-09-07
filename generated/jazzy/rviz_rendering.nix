{
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_cmake_lint_cmake,
  ament_cmake_ros,
  ament_cmake_uncrustify,
  ament_cmake_xmllint,
  ament_index_cpp,
  ament_lint_auto,
  buildRosPackage,
  eigen,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  qt5,
  resource_retriever,
  rviz_assimp_vendor,
  rviz_ogre_vendor,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rviz_rendering = substituteSource {
      src = fetchgit {
        name = "rviz_rendering-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "bf104d65ded14ec2e20dc051ccc20a03b4813af9";
        hash = "sha256-MQmIT2egT7gQ+HbJhdCd+/lVwxoQgsZOmMQ9xIX76uQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rviz_rendering";
  version = "14.1.5-1";
  src = sources.rviz_rendering;
  nativeBuildInputs = [ ament_cmake_ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ eigen3_cmake_module ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp eigen qt5.qtbase resource_retriever rviz_assimp_vendor rviz_ogre_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_cppcheck ament_cmake_cpplint ament_cmake_gmock ament_cmake_gtest ament_cmake_lint_cmake ament_cmake_uncrustify ament_cmake_xmllint ament_lint_auto rviz_assimp_vendor ];
  missingDependencies = [  ];
  meta = {
    description = "Library which provides the 3D rendering functionality in rviz.";
  };
}
