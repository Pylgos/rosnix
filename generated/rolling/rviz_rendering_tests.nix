{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_index_cpp,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  qt5,
  resource_retriever,
  rviz_rendering,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rviz_rendering_tests = substituteSource {
      src = fetchgit {
        name = "rviz_rendering_tests-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "4b755d0dd9ca37ce72ab1dae4224d14e737dfc9a";
        hash = "sha256-54Zj5CZG9GYIuuJuGa/ja3saIC3rg8CbKDJ1+3/4TeE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rviz_rendering_tests";
  version = "14.2.5-1";
  src = sources.rviz_rendering_tests;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ qt5.qtbase resource_retriever rviz_rendering ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock ament_cmake_gtest ament_index_cpp ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Example plugin for RViz - documents and tests RViz plugin development";
  };
}
