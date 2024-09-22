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
        rev = "835b107be43af1e2408ea0a10948c4cd7bff9aec";
        hash = "sha256-t1n90odTaHGDGkC11exZPNOWGu6I1Uo0+ejHFwVIhv8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_charging_schedule";
  version = "2.7.1-1";
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
