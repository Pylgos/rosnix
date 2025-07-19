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
  version = "0.3.1-1";
  src = finalAttrs.passthru.sources."canopen_fake_slaves";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ lely-core-libraries lifecycle-msgs rclcpp rclcpp-lifecycle ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ lely-core-libraries lifecycle-msgs rclcpp rclcpp-lifecycle ];
  checkInputs = [ ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "canopen_fake_slaves" = substituteSource {
      src = fetchgit {
        name = "canopen_fake_slaves-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "c6a5c1334580de4fcc398c055e0cbd61044bc740";
        hash = "sha256-B/G/UPifbWBkpTcWPB+zKigi0mCXftN6KXLRhvFVbHA=";
      };
    };
  });
  meta = {
    description = "Package with mock canopen slave";
  };
})
