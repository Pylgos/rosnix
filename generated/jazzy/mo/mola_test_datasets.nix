{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_xmllint,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    mola_test_datasets-ad71416c842308c8d2461f7d495e92f4c14c1810 = substituteSource {
      src = fetchgit {
        name = "mola_test_datasets-ad71416c842308c8d2461f7d495e92f4c14c1810-source";
        url = "https://github.com/ros2-gbp/mola_test_datasets-release.git";
        rev = "ad71416c842308c8d2461f7d495e92f4c14c1810";
        hash = "sha256-xywSfsEKXi9rua2N0QUVfsaXS2UdW3cHCKj0Tv7at50=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_test_datasets";
  version = "0.3.4-1";
  src = sources.mola_test_datasets-ad71416c842308c8d2461f7d495e92f4c14c1810;
  nativeBuildInputs = [ ament_cmake ament_cmake_gtest ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament_cmake_xmllint ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Small SLAM dataset extracts used for demos or unit tests in the rest of MOLA packages";
  };
}
