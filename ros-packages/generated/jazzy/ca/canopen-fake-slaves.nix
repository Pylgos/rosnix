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
  version = "0.2.9-2";
  src = finalAttrs.passthru.sources."canopen_fake_slaves";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ lely-core-libraries lifecycle-msgs rclcpp rclcpp-lifecycle ];
  checkInputs = [ ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "canopen_fake_slaves" = substituteSource {
      src = fetchgit {
        name = "canopen_fake_slaves-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "19e6ce4bc36465f2bbd2b6a8c359391d8cd8d166";
        hash = "sha256-3/FPYI561bff5nqES47wLASGbBezxQt3pcmShGE1WOM=";
      };
    };
  });
  meta = {
    description = "Package with mock canopen slave";
  };
})
