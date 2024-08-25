{
  ament_cmake,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_cmake_lint_cmake,
  ament_cmake_uncrustify,
  ament_cmake_xmllint,
  ament_index_cpp,
  ament_lint_auto,
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
        rev = "1e738eb5cfa5cbd1762bd0b3a45bea1fb30b277d";
        hash = "sha256-xCUTukgJ6ArD//u3JPEP1/+0YsfxpYxgbMsrq9VTD2g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rviz_rendering_tests";
  version = "14.1.4-1";
  src = sources.rviz_rendering_tests;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ qt5.qtbase resource_retriever rviz_rendering ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_cppcheck ament_cmake_cpplint ament_cmake_gmock ament_cmake_gtest ament_cmake_lint_cmake ament_cmake_uncrustify ament_cmake_xmllint ament_index_cpp ament_lint_auto ];
  missingDependencies = [  ];
  meta = {
    description = "Example plugin for RViz - documents and tests RViz plugin development";
  };
}
