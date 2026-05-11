{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "swri_console_util";
  version = "3.8.9-1";
  src = finalAttrs.passthru.sources."swri_console_util";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "swri_console_util" = substituteSource {
      src = fetchgit {
        name = "swri_console_util-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "5aadbe2ce9fd04dba96ea4a799330bb304d23928";
        hash = "sha256-Kx4RhXdVvNfKUAnkzTDt15QpCTm3PA7yL5aIjWAGwVU=";
      };
    };
  });
  meta = {
    description = "\n    Utility functions for interacting with console\n  ";
  };
})
