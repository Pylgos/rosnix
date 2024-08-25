{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    tcb_span = substituteSource {
      src = fetchgit {
        name = "tcb_span-source";
        url = "https://github.com/ros2-gbp/cpp_polyfills-release.git";
        rev = "6512481c861c90c5702c8baf994a281b9df9d022";
        hash = "sha256-61JrUYgWw+LJJmryzDfZte0H+hhzDbHqOY1wEyk996Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tcb_span";
  version = "1.0.2-4";
  src = sources.tcb_span;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ];
  missingDependencies = [  ];
  meta = {
    description = "Implementation of C++20's std::span";
  };
}
