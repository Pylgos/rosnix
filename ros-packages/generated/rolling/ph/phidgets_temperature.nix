{
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  phidgets_api,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    phidgets_temperature-0d528bffa077cfd054f76adf15e1481258f3b906 = substituteSource {
      src = fetchgit {
        name = "phidgets_temperature-0d528bffa077cfd054f76adf15e1481258f3b906-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "0d528bffa077cfd054f76adf15e1481258f3b906";
        hash = "sha256-AUCf5/QLj4oi3q8yB/SIYcdPJoog9kG0irWiQraVKgQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "phidgets_temperature";
  version = "2.3.3-1";
  src = sources.phidgets_temperature-0d528bffa077cfd054f76adf15e1481258f3b906;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ launch phidgets_api rclcpp rclcpp_components std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Driver for the Phidgets Temperature devices";
  };
}
