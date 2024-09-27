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
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    vision_msgs-4e50b05d0740fa6777421eeeb574fe09616e08b8 = substituteSource {
      src = fetchgit {
        name = "vision_msgs-4e50b05d0740fa6777421eeeb574fe09616e08b8-source";
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
  src = sources.vision_msgs-4e50b05d0740fa6777421eeeb574fe09616e08b8;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Messages for interfacing with various computer vision pipelines, such as object detectors.";
  };
}
