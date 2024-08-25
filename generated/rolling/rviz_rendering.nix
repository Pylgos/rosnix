{
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_index_cpp,
  ament_lint_auto,
  ament_lint_common,
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
        rev = "c3ce2b9e898342026398ed7313b5ccf9d5eab49a";
        hash = "sha256-k4CYfxvn2F9kjDlufFq+o5+v3mIMpFLHkT8i+nQrMrU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rviz_rendering";
  version = "14.2.5-1";
  src = sources.rviz_rendering;
  nativeBuildInputs = [ ament_cmake_ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ eigen3_cmake_module ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp eigen qt5.qtbase resource_retriever rviz_assimp_vendor rviz_ogre_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock ament_cmake_gtest ament_lint_auto ament_lint_common rviz_assimp_vendor ];
  missingDependencies = [  ];
  meta = {
    description = "Library which provides the 3D rendering functionality in rviz.";
  };
}
