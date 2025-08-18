{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  clips-vendor,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cx_utils";
  version = "0.1.3-1";
  src = finalAttrs.passthru.sources."cx_utils";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ clips-vendor rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" "spdlog" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ clips-vendor rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "spdlog" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "cx_utils" = substituteSource {
      src = fetchgit {
        name = "cx_utils-source";
        url = "https://github.com/ros2-gbp/clips_executive-release.git";
        rev = "aa805c9e734c83e18970894c03d4b04b13972883";
        hash = "sha256-v/wAy+Ehy7a8Ec/CcfRysikYa4Mbe1IpSLwD15zqRXE=";
      };
    };
  });
  meta = {
    description = "Utilities for the ROS2 CLIPS-Executive";
  };
})
