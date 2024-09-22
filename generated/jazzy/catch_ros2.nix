{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  ros2launch,
  rosSystemPackages,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    catch_ros2 = substituteSource {
      src = fetchFromGitHub {
        name = "catch_ros2-source";
        owner = "ros2-gbp";
        repo = "catch_ros2-release";
        rev = "f16df2c7b6a00e3836e2546f9b66bf3b447cbe42";
        hash = "sha256-8+FIcqzIHZrfEeATgko1oxSpJA3YY5lis1+sEd2Y/Rk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "catch_ros2";
  version = "0.2.1-2";
  src = sources.catch_ros2;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp ros2launch std_srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Catch2 testing framework for ROS 2 unit and integration tests.";
  };
}
