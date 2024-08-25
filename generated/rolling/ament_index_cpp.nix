{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_index_cpp = substituteSource {
      src = fetchgit {
        name = "ament_index_cpp-source";
        url = "https://github.com/ros2-gbp/ament_index-release.git";
        rev = "b25d40851af3f8b572dc8f3d7d9214535de2ac67";
        hash = "sha256-nTz5QUgRwH0FBIhOoOQC9v4MI4Vhnm5iSpweeOD31nU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_index_cpp";
  version = "1.9.0-1";
  src = sources.ament_index_cpp;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "C++ API to access the ament resource index.";
  };
}
