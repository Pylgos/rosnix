{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic-msgs,
  image-transport,
  mkSourceSet,
  nav-msgs,
  nav2-common,
  nav2-core,
  nav2-msgs,
  nav2-util,
  pluginlib,
  rclcpp,
  rclcpp-action,
  rclcpp-lifecycle,
  robot-localization,
  rosSystemPackages,
  substituteSource,
  tf2-ros,
}:
let
  sources = mkSourceSet (sources: {
    "nav2_waypoint_follower" = substituteSource {
      src = fetchgit {
        name = "nav2_waypoint_follower-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "f3ef643e5c81b498b5fcdc3bf2d937b4fa93b104";
        hash = "sha256-0cD4CecbDGvV70fMa3RmgpZ5MHzPM4Pm/ee7ksLer8M=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "nav2_waypoint_follower";
  version = "1.3.2-1";
  src = sources."nav2_waypoint_follower";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv-bridge geographic-msgs image-transport nav2-common nav2-core nav2-msgs nav2-util nav-msgs pluginlib rclcpp rclcpp-action rclcpp-lifecycle robot-localization tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A waypoint follower navigation server";
  };
}
