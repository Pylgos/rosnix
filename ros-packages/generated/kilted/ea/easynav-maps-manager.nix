{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  easynav-common,
  easynav-core,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "easynav_maps_manager";
  version = "0.3.2-1";
  src = finalAttrs.passthru.sources."easynav_maps_manager";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ easynav-common easynav-core lifecycle-msgs pluginlib rclcpp rclcpp-lifecycle ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ easynav-common easynav-core lifecycle-msgs pluginlib rclcpp rclcpp-lifecycle ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "easynav_maps_manager" = substituteSource {
      src = fetchgit {
        name = "easynav_maps_manager-source";
        url = "https://github.com/EasyNavigation/EasyNavigation-release.git";
        rev = "b0a15775d5ba26a059b6c99cb6dcec19d3a4e2aa";
        hash = "sha256-tc4G+Koa+Wx5LJjYnRdRKxWDQnLA14qfioTfGoh4AyU=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: MapsManager package.";
  };
})
