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
  version = "0.1.2-1";
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
        rev = "2b132f8cd3bddd3d5c0eb05f6a6b3ca32614b25c";
        hash = "sha256-VF224DvkuxKFNMfE6DksHENxWEa/1imyuwXk0wOM0rk=";
      };
    };
  });
  meta = {
    description = "Utilities for the ROS2 CLIPS-Executive";
  };
})
