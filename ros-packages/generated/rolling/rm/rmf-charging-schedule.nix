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
  version = "2.12.0-2";
  src = finalAttrs.passthru.sources."rmf_charging_schedule";
  propagatedNativeBuildInputs = [ rclpy rmf-fleet-msgs ];
  propagatedBuildInputs = [ rclpy rmf-fleet-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_charging_schedule" = substituteSource {
      src = fetchgit {
        name = "rmf_charging_schedule-source";
        url = "https://github.com/ros2-gbp/rmf_ros2-release.git";
        rev = "0f294092b91d0b058b53730b69f61c70a0723ac8";
        hash = "sha256-owY+ODCmhHTO8ysDQ3PDPAAMzi+iaQmE2gQexX4OH04=";
      };
    };
  });
  meta = {
    description = "Node for a fixed 24-hour rotating charger usage schedule";
  };
})
