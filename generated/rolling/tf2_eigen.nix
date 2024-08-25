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
  geometry_msgs,
  substituteSource,
  tf2,
  tf2_ros,
}:
let
  sources = rec {
    tf2_eigen = substituteSource {
      src = fetchgit {
        name = "tf2_eigen-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "e882a6a5c9f3eea2b5c38a6cb6412a1b7e549186";
        hash = "sha256-l/M1K4PXTFHNzXwQBC19eRLgt3HkSSGcnhcuWIySiFQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_eigen";
  version = "0.38.2-1";
  src = sources.tf2_eigen;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen geometry_msgs tf2 tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "tf2_eigen";
  };
}
