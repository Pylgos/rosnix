{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  bullet,
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
    tf2_bullet = substituteSource {
      src = fetchgit {
        name = "tf2_bullet-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "c6ddf880bff4f7ca9e8a9132fb0dd350f554202f";
        hash = "sha256-GNLOhibPOOtz5caJ7wYbYMmU7hqt2MhvBZSsS05hvAU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_bullet";
  version = "0.38.2-1";
  src = sources.tf2_bullet;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ bullet geometry_msgs tf2 tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "tf2_bullet";
  };
}
