{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rmf-fleet-msgs,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rmf_charging_schedule";
  version = "2.9.0-1";
  src = finalAttrs.passthru.sources."rmf_charging_schedule";
  propagatedNativeBuildInputs = [ rclpy rmf-fleet-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-icecream" ]; };
  propagatedBuildInputs = [ rclpy rmf-fleet-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-icecream" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rmf_charging_schedule" = substituteSource {
      src = fetchgit {
        name = "rmf_charging_schedule-source";
        url = "https://github.com/ros2-gbp/rmf_ros2-release.git";
        rev = "9f5385290e685fad890ee032033f5d0bc9cc7c41";
        hash = "sha256-bgppuQqlMEhk1gzEL70pHOXlpeMn7Ul70qzbCyyUGkM=";
      };
    };
  });
  meta = {
    description = "Node for a fixed 24-hour rotating charger usage schedule";
  };
})
