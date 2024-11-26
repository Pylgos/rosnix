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
  version = "2.7.1-1";
  src = finalAttrs.passthru.sources."rmf_charging_schedule";
  propagatedBuildInputs = [ rclpy rmf-fleet-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rmf_charging_schedule" = substituteSource {
        src = fetchgit {
          name = "rmf_charging_schedule-source";
          url = "https://github.com/ros2-gbp/rmf_ros2-release.git";
          rev = "835b107be43af1e2408ea0a10948c4cd7bff9aec";
          hash = "sha256-t1n90odTaHGDGkC11exZPNOWGu6I1Uo0+ejHFwVIhv8=";
        };
      };
    });
  };
  meta = {
    description = "Node for a fixed 24-hour rotating charger usage schedule";
  };
})
