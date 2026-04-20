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
  version = "0.2.1-2";
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
        rev = "ee9a4a5206a933fa04a13978c3bde59cda8ff495";
        hash = "sha256-5oxc5bXUIpMA4dwVuNlb6/msxjsUtWryjJnvqx2OiJU=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: VFF Controller package.";
  };
})
