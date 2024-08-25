{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclpy,
  rmf_fleet_msgs,
  substituteSource,
}:
let
  sources = rec {
    rmf_charging_schedule = substituteSource {
      src = fetchgit {
        name = "rmf_charging_schedule-source";
        url = "https://github.com/ros2-gbp/rmf_ros2-release.git";
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
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy rmf_fleet_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Node for a fixed 24-hour rotating charger usage schedule";
  };
}
