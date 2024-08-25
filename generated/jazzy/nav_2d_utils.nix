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
  nav2_common,
  nav2_msgs,
  nav2_util,
  nav_2d_msgs,
  nav_msgs,
  std_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
}:
let
  sources = rec {
    nav_2d_utils = substituteSource {
      src = fetchgit {
        name = "nav_2d_utils-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "7b42cf777bd801014d2da6ceb20c76b1d14f0a78";
        hash = "sha256-oHxnA0gWubyHWzrWuYRiGcDW0H2rWuYyUUA+UJf9XZE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav_2d_utils";
  version = "1.3.1-1";
  src = sources.nav_2d_utils;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs nav2_common nav2_msgs nav2_util nav_2d_msgs nav_msgs std_msgs tf2 tf2_geometry_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "A handful of useful utility functions for nav_2d packages.";
  };
}
