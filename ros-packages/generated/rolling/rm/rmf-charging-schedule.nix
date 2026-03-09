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
  version = "2.12.0-1";
  src = finalAttrs.passthru.sources."rmf_charging_schedule";
  propagatedNativeBuildInputs = [ rclpy rmf-fleet-msgs ];
  propagatedBuildInputs = [ rclpy rmf-fleet-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_charging_schedule" = substituteSource {
      src = fetchgit {
        name = "rmf_charging_schedule-source";
        url = "https://github.com/ros2-gbp/rmf_ros2-release.git";
        rev = "05277efa8b2cf98cac14421dfdeb2fbea56cc77f";
        hash = "sha256-owY+ODCmhHTO8ysDQ3PDPAAMzi+iaQmE2gQexX4OH04=";
      };
    };
  });
  meta = {
    description = "Node for a fixed 24-hour rotating charger usage schedule";
  };
})
