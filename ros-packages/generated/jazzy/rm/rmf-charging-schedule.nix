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
  version = "2.7.2-1";
  src = finalAttrs.passthru.sources."rmf_charging_schedule";
  propagatedNativeBuildInputs = [ rclpy ];
  propagatedBuildInputs = [ rmf-fleet-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_charging_schedule" = substituteSource {
      src = fetchgit {
        name = "rmf_charging_schedule-source";
        url = "https://github.com/ros2-gbp/rmf_ros2-release.git";
        rev = "b6f6991030adbb82f57c229a8ba8b4eafe8c3b3d";
        hash = "sha256-ql4Svaydi+6EMmJD2iI8yl4XF4W/obllLFTfgxqk5CY=";
      };
    };
  });
  meta = {
    description = "Node for a fixed 24-hour rotating charger usage schedule";
  };
})
