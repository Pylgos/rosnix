{
  ament_cmake,
  ament_lint_auto,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  lely_core_libraries,
  lifecycle_msgs,
  rclcpp,
  rclcpp_lifecycle,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    canopen_fake_slaves = substituteSource {
      src = fetchFromGitHub {
        name = "canopen_fake_slaves-source";
        owner = "ros2-gbp";
        repo = "ros2_canopen-release";
        rev = "324d9e21e9293dc8c655cc39455cae88d5448fe4";
        hash = "sha256-annrsLqumlQ8jjhOl8DNmmBQEhPCgz2244cPZ70aVII=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "canopen_fake_slaves";
  version = "0.2.12-2";
  src = sources.canopen_fake_slaves;
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
