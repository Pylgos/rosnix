{
  ament-cmake,
  ament-cmake-gmock,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-action,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-ros,
  tf2-web-republisher-interfaces,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tf2_web_republisher";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."tf2_web_republisher";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs rclcpp rclcpp-action rclcpp-components tf2 tf2-ros tf2-web-republisher-interfaces ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs rclcpp rclcpp-action rclcpp-components tf2 tf2-ros tf2-web-republisher-interfaces ];
  checkInputs = [ ament-cmake-gmock ];
  passthru.sources = mkSourceSet (sources: {
    "tf2_web_republisher" = substituteSource {
      src = fetchgit {
        name = "tf2_web_republisher-source";
        url = "https://github.com/ros2-gbp/tf2_web_republisher-release.git";
        rev = "5025a85a0d7d4befa0896d76d6879e8bb6eb0a24";
        hash = "sha256-SgoucpSR/lEz/yrtodxzycgWf+GJrjBIW8LBa1kFBGU=";
      };
    };
  });
  meta = {
    description = "Republishing of Selected TFs";
  };
})
