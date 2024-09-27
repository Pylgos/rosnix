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
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  resource_retriever,
  rosSystemPackages,
  rviz_assimp_vendor,
  rviz_ogre_vendor,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rviz_rendering-bf104d65ded14ec2e20dc051ccc20a03b4813af9 = substituteSource {
      src = fetchgit {
        name = "rviz_rendering-bf104d65ded14ec2e20dc051ccc20a03b4813af9-source";
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
  src = sources.rviz_rendering-bf104d65ded14ec2e20dc051ccc20a03b4813af9;
  nativeBuildInputs = [ ament_cmake_ros wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ eigen3_cmake_module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_cpp resource_retriever rviz_assimp_vendor rviz_ogre_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libqt5-core" "libqt5-gui" "libqt5-opengl" "libqt5-widgets" "qtbase5-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_cppcheck ament_cmake_cpplint ament_cmake_gmock ament_cmake_gtest ament_cmake_lint_cmake ament_cmake_uncrustify ament_cmake_xmllint ament_lint_auto rviz_assimp_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Library which provides the 3D rendering functionality in rviz.";
  };
}
