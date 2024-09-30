{
  ament-cmake,
  buildRosPackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  sensor-msgs,
  sick-safevisionary-base,
  sick-safevisionary-interfaces,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "sick_safevisionary_driver" = substituteSource {
      src = fetchgit {
        name = "sick_safevisionary_driver-source";
        url = "https://github.com/ros2-gbp/sick_safevisionary_ros2-release.git";
        rev = "88de2851a6fc1871b02acf8d5984603a7609b555";
        hash = "sha256-+JkVULStq1kUDR609jEbn44uWsjZ4O5x1ogtxSHoM8Y=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "sick_safevisionary_driver";
  version = "1.0.3-3";
  src = sources."sick_safevisionary_driver";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv-bridge lifecycle-msgs rclcpp rclcpp-lifecycle sensor-msgs sick-safevisionary-base sick-safevisionary-interfaces ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Provides an interface to read the sensor output of a SICK Safevisionary sensor in ROS 2";
  };
}
