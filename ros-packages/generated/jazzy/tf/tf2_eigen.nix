{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2_ros,
}:
let
  sources = rec {
    tf2_eigen-fc5413683bbad63f20db3da1e788800683b3aa98 = substituteSource {
      src = fetchgit {
        name = "tf2_eigen-fc5413683bbad63f20db3da1e788800683b3aa98-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "fc5413683bbad63f20db3da1e788800683b3aa98";
        hash = "sha256-pgXSqFQCFNNoDKQSqj5Iy3zm1vPXuG7Hr8lFvCR3LG4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_eigen";
  version = "0.36.4-1";
  src = sources.tf2_eigen-fc5413683bbad63f20db3da1e788800683b3aa98;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs tf2 tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "tf2_eigen";
  };
}
