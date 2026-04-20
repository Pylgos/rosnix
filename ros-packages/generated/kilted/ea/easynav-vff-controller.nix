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
  mkSourceSet,
  nav-msgs,
  pcl-ros,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "easynav_vff_controller";
  version = "0.3.1-1";
  src = finalAttrs.passthru.sources."easynav_vff_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ easynav-common easynav-core nav-msgs pcl-ros pluginlib rclcpp rclcpp-lifecycle visualization-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ easynav-common easynav-core nav-msgs pcl-ros pluginlib rclcpp rclcpp-lifecycle visualization-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "easynav_vff_controller" = substituteSource {
      src = fetchgit {
        name = "easynav_vff_controller-source";
        url = "https://github.com/EasyNavigation/easynav_plugins-release.git";
        rev = "6d65828edf71ed2a57fa30839b504bb5b75939c3";
        hash = "sha256-H/MB+i6VVzdlrqXUglFmEkZc7G/zzoTXOBfQGblnLZw=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: VFF Controller package.";
  };
})
