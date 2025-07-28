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
  version = "2.11.1-1";
  src = finalAttrs.passthru.sources."rmf_charging_schedule";
  propagatedNativeBuildInputs = [ rclpy rmf-fleet-msgs ];
  propagatedBuildInputs = [ rclpy rmf-fleet-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_charging_schedule" = substituteSource {
      src = fetchgit {
        name = "rmf_charging_schedule-source";
        url = "https://github.com/ros2-gbp/rmf_ros2-release.git";
        rev = "3259cd7518d69c003e582670bf03bbd404e667d0";
        hash = "sha256-ocJtXXRH3r6WSCOO2lPr945Vy9RRiASZ7C++mKZiarY=";
      };
    };
  });
  meta = {
    description = "Node for a fixed 24-hour rotating charger usage schedule";
  };
})
