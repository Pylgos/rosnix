{
  ament-cmake,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lely-core-libraries,
  lifecycle-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "canopen_fake_slaves";
  version = "0.2.12-2";
  src = finalAttrs.passthru.sources."canopen_fake_slaves";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ lely-core-libraries lifecycle-msgs rclcpp rclcpp-lifecycle ];
  checkInputs = [ ament-lint-auto ];
  passthru = {
    sources = mkSourceSet (sources: {
      "canopen_fake_slaves" = substituteSource {
        src = fetchgit {
          name = "canopen_fake_slaves-source";
          url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
          rev = "324d9e21e9293dc8c655cc39455cae88d5448fe4";
          hash = "sha256-annrsLqumlQ8jjhOl8DNmmBQEhPCgz2244cPZ70aVII=";
        };
      };
    });
  };
  meta = {
    description = "Package with mock canopen slave";
  };
})
