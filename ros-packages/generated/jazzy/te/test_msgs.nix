{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
  test_interface_files,
}:
let
  sources = rec {
    test_msgs-949ba51a791bdd1fcc9bee93eebad446d617a89d = substituteSource {
      src = fetchgit {
        name = "test_msgs-949ba51a791bdd1fcc9bee93eebad446d617a89d-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "949ba51a791bdd1fcc9bee93eebad446d617a89d";
        hash = "sha256-7ptSwzU+Pw1ORsW5Zawq4gKz438/XaoJGhvKIYsrwI4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "test_msgs";
  version = "2.0.2-2";
  src = sources.test_msgs-949ba51a791bdd1fcc9bee93eebad446d617a89d;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime test_interface_files ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package containing message definitions and fixtures used exclusively for testing purposes.";
  };
}
