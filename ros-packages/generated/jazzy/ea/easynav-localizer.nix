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
  version = "0.2.2-1";
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
        rev = "fcf356a74777549560e87493c8462ff23b864967";
        hash = "sha256-whmYV9Lr+YZlse9YI4XtsiGt6nzBzaqWPKJKEo7gO/I=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: Localizer package.";
  };
})
