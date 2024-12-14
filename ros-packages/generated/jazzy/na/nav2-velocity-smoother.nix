{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav2-common,
  nav2-util,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_velocity_smoother";
  version = "1.3.4-1";
  src = finalAttrs.passthru.sources."nav2_velocity_smoother";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs nav2-common nav2-util rclcpp rclcpp-components ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_velocity_smoother" = substituteSource {
      src = fetchgit {
        name = "nav2_velocity_smoother-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "8aac51ae85f0838f465705827e8f2c0b3c63ed98";
        hash = "sha256-VLTnOcXJscei3Qztfh6pEFHpNp5AMvtKzz0VN3+4XlU=";
      };
    };
  });
  meta = {
    description = "Nav2's Output velocity smoother";
  };
})
