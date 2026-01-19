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
  nav-msgs,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "easynav_localizer";
  version = "0.3.2-1";
  src = finalAttrs.passthru.sources."easynav_localizer";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ easynav-common easynav-core lifecycle-msgs nav-msgs pluginlib rclcpp rclcpp-lifecycle ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ easynav-common easynav-core lifecycle-msgs nav-msgs pluginlib rclcpp rclcpp-lifecycle ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "easynav_localizer" = substituteSource {
      src = fetchgit {
        name = "easynav_localizer-source";
        url = "https://github.com/EasyNavigation/EasyNavigation-release.git";
        rev = "7b037cfcaca43f0cc5f666aec42f6ad73c59d9e3";
        hash = "sha256-vRl7rRv3q0L1NVBtt6OwOOsRQ6A38Uowh5lM3GFQGDE=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: Localizer package.";
  };
})
