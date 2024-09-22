{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  fuse_core,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    fuse_graphs = substituteSource {
      src = fetchFromGitHub {
        name = "fuse_graphs-source";
        owner = "ros2-gbp";
        repo = "fuse-release";
        rev = "1bad4f6b8670723bee18504d853167998a03dd88";
        hash = "sha256-OAhx+XniRLHvJMkD54lfbnCWK7EE3q/Evrh2skJwNeQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_graphs";
  version = "1.2.0-1";
  src = sources.fuse_graphs;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ fuse_core pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libceres-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "benchmark" ]; };
  meta = {
    description = "The fuse_graphs package provides some concrete implementations of the fuse_core::Graph interface.";
  };
}
