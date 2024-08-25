{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_xmllint,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    mola_test_datasets = substituteSource {
      src = fetchgit {
        name = "mola_test_datasets-source";
        url = "https://github.com/ros2-gbp/mola_test_datasets-release.git";
        rev = "c7b4340bd664ef76cbeed0e1ad86046c4d8928c3";
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
  src = sources.mola_test_datasets;
  nativeBuildInputs = [ ament_cmake ament_cmake_gtest cmake ];
  propagatedNativeBuildInputs = [ ament_cmake_xmllint ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Small SLAM dataset extracts used for demos or unit tests in the rest of MOLA packages";
  };
}
