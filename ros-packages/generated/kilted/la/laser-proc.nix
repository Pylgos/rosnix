{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  class-loader,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "laser_proc";
  version = "1.0.2-7";
  src = finalAttrs.passthru.sources."laser_proc";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ class-loader rclcpp rclcpp-components sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ class-loader rclcpp rclcpp-components sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "laser_proc" = substituteSource {
      src = fetchgit {
        name = "laser_proc-source";
        url = "https://github.com/ros2-gbp/laser_proc-release.git";
        rev = "b0447d18770bdc1629bd628a3bb6ceb773ce9b5f";
        hash = "sha256-h2lPjaJimCF/20eVEH3+ZS7CDqoML9voXq2B0x32NSY=";
      };
    };
  });
  meta = {
    description = "laser_proc";
  };
})
