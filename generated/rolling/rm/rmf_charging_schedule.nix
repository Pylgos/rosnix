{
  buildRosPackage,
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
    rmf_charging_schedule-835b107be43af1e2408ea0a10948c4cd7bff9aec = substituteSource {
      src = fetchgit {
        name = "rmf_charging_schedule-835b107be43af1e2408ea0a10948c4cd7bff9aec-source";
        url = "https://github.com/ros2-gbp/rmf_ros2-release.git";
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
  src = sources.rmf_charging_schedule-835b107be43af1e2408ea0a10948c4cd7bff9aec;
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
