{
  ament_cmake,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lely_core_libraries,
  lifecycle_msgs,
  mkSourceSet,
  rclcpp,
  rclcpp_lifecycle,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "canopen_fake_slaves" = substituteSource {
      src = fetchgit {
        name = "canopen_fake_slaves-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "324d9e21e9293dc8c655cc39455cae88d5448fe4";
        hash = "sha256-annrsLqumlQ8jjhOl8DNmmBQEhPCgz2244cPZ70aVII=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "canopen_fake_slaves";
  version = "0.2.12-2";
  src = sources."canopen_fake_slaves";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ lely_core_libraries lifecycle_msgs rclcpp rclcpp_lifecycle ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Package with mock canopen slave";
  };
}
