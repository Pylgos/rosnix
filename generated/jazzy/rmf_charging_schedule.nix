{
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rclpy,
  rmf_fleet_msgs,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    rmf_charging_schedule = substituteSource {
      src = fetchFromGitHub {
        name = "rmf_charging_schedule-source";
        owner = "ros2-gbp";
        repo = "rmf_ros2-release";
        rev = "b6f6991030adbb82f57c229a8ba8b4eafe8c3b3d";
        hash = "sha256-ql4Svaydi+6EMmJD2iI8yl4XF4W/obllLFTfgxqk5CY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_charging_schedule";
  version = "2.7.2-1";
  src = sources.rmf_charging_schedule;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclpy rmf_fleet_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Node for a fixed 24-hour rotating charger usage schedule";
  };
}
