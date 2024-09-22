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
  rclcpp_components,
  rosSystemPackages,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    ntpd_driver = substituteSource {
      src = fetchFromGitHub {
        name = "ntpd_driver-source";
        owner = "ros2-gbp";
        repo = "ntpd_driver-release";
        rev = "88930151cfd996362a02a17d50c6a727638abe2e";
        hash = "sha256-Y3hISLK0EHzcJD4MrfgxDdmYH+cpgQTjbH3DCmbd0VE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ntpd_driver";
  version = "2.2.0-4";
  src = sources.ntpd_driver;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp rclcpp_components sensor_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libpoco-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ntpd_driver sends TimeReference message time to ntpd server";
  };
}
