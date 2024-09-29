{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-cpp,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-configs-utils,
  moveit-resources-panda-moveit-config,
  moveit-setup-app-plugins,
  moveit-setup-controllers,
  moveit-setup-core-plugins,
  moveit-setup-framework,
  moveit-setup-srdf-plugins,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "moveit_setup_assistant" = substituteSource {
      src = fetchgit {
        name = "moveit_setup_assistant-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "f7757999faf4a83bf5edfe6b9173f68f5ae3eded";
        hash = "sha256-5idmqvp9XuS4nBJLzXsLmKu8qHJDOFq0KNVIK+4xWXU=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "moveit-setup-assistant";
  version = "2.11.0-1";
  src = sources."moveit_setup_assistant";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament-index-cpp moveit-configs-utils moveit-setup-app-plugins moveit-setup-controllers moveit-setup-core-plugins moveit-setup-framework moveit-setup-srdf-plugins pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qtbase5-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest moveit-resources-panda-moveit-config ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Generates a configuration package that makes it easy to use MoveIt";
  };
}
