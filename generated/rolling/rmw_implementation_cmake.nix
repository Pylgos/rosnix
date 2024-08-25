{
  ament_cmake,
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
    rmw_implementation_cmake = substituteSource {
      src = fetchgit {
        name = "rmw_implementation_cmake-source";
        url = "https://github.com/ros2-gbp/rmw-release.git";
        rev = "88d851830e56ae6e8f8bf1b09b856e0f8c81eb7b";
        hash = "sha256-eqlVZn8jHaQRoZJEjE+HiH+RtfK70hgE5sOCTuXTpLQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmw_implementation_cmake";
  version = "7.4.3-1";
  src = sources.rmw_implementation_cmake;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "CMake functions which can discover and enumerate available implementations.";
  };
}
