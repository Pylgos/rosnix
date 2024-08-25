{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  poco,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    ntpd_driver = substituteSource {
      src = fetchgit {
        name = "ntpd_driver-source";
        url = "https://github.com/ros2-gbp/ntpd_driver-release.git";
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
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ poco rclcpp rclcpp_components sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "ntpd_driver sends TimeReference message time to ntpd server";
  };
}
