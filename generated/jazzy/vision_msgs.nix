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
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    vision_msgs = substituteSource {
      src = fetchgit {
        name = "vision_msgs-source";
        url = "https://github.com/ros2-gbp/vision_msgs-release.git";
        rev = "4e50b05d0740fa6777421eeeb574fe09616e08b8";
        hash = "sha256-3eI3eKu1pjYzfsXNxO7zGJoJNG6s9QU4SjIzqZvSNEI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "vision_msgs";
  version = "4.1.1-3";
  src = sources.vision_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Messages for interfacing with various computer vision pipelines, such as object detectors.";
  };
}
