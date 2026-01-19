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
  version = "0.2.2-1";
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
        rev = "d0ef8b5aa418a15193b942499cc0090c39723463";
        hash = "sha256-JSTBI7LsqJ7cbg03moKNxpGfEfG6konZBfRxp4NMFp4=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: MapsManager package.";
  };
})
