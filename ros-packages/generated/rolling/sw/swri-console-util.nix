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
  version = "3.8.1-1";
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
        rev = "4c67ea573b3e4248de3494cd2a274da8acb469e4";
        hash = "sha256-PztlXxS1xvwyPYqIKJyRpnX97YDBkHoPGhlVI7dMN80=";
      };
    };
  });
  meta = {
    description = "\n    Utility functions for interacting with console\n  ";
  };
})
