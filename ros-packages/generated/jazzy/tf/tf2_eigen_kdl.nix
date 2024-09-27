{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  orocos_kdl_vendor,
  rosSystemPackages,
  substituteSource,
  tf2,
}:
let
  sources = rec {
    tf2_eigen_kdl-4e1452d3f3c580368b58bf60d5ca18eb6582245e = substituteSource {
      src = fetchgit {
        name = "tf2_eigen_kdl-4e1452d3f3c580368b58bf60d5ca18eb6582245e-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "4e1452d3f3c580368b58bf60d5ca18eb6582245e";
        hash = "sha256-stCQiwa7ek5lXkoU9tbHpzGhQN2wglHvNDDTozRzUa0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_eigen_kdl";
  version = "0.36.4-1";
  src = sources.tf2_eigen_kdl-4e1452d3f3c580368b58bf60d5ca18eb6582245e;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ orocos_kdl_vendor tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Conversion functions between: - Eigen and KDL";
  };
}
