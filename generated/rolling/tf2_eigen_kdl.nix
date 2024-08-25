{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  orocos_kdl_vendor,
  substituteSource,
  tf2,
}:
let
  sources = rec {
    tf2_eigen_kdl = substituteSource {
      src = fetchgit {
        name = "tf2_eigen_kdl-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "ce6a8144321470bfe42378e436dac553e5971a1a";
        hash = "sha256-lkRiGG90mjYM+rLMfHv4j4wQ8TGQYZQSqS75x/5Ks6w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_eigen_kdl";
  version = "0.38.2-1";
  src = sources.tf2_eigen_kdl;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen orocos_kdl_vendor tf2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Conversion functions between: - Eigen and KDL";
  };
}
