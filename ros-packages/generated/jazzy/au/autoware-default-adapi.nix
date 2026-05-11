{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-adapi-specs,
  autoware-adapi-v1-msgs,
  autoware-adapi-version-msgs,
  autoware-cmake,
  autoware-component-interface-specs,
  autoware-geography-utils,
  autoware-global-parameter-loader,
  autoware-lint-common,
  autoware-localization-msgs,
  autoware-motion-utils,
  autoware-planning-msgs,
  autoware-qos-utils,
  autoware-system-msgs,
  autoware-utils-rclcpp,
  autoware-vehicle-info-utils,
  autoware-vehicle-msgs,
  buildAmentCmakePackage,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic-msgs,
  launch-testing,
  launch-testing-ament-cmake,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  shape-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_default_adapi";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_default_adapi";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-adapi-specs autoware-adapi-v1-msgs autoware-adapi-version-msgs autoware-component-interface-specs autoware-geography-utils autoware-global-parameter-loader autoware-localization-msgs autoware-motion-utils autoware-planning-msgs autoware-qos-utils autoware-system-msgs autoware-utils-rclcpp autoware-vehicle-info-utils autoware-vehicle-msgs diagnostic-updater geographic-msgs nav-msgs rclcpp rclcpp-components shape-msgs std-srvs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-flask" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-adapi-specs autoware-adapi-v1-msgs autoware-adapi-version-msgs autoware-component-interface-specs autoware-geography-utils autoware-global-parameter-loader autoware-localization-msgs autoware-motion-utils autoware-planning-msgs autoware-qos-utils autoware-system-msgs autoware-utils-rclcpp autoware-vehicle-info-utils autoware-vehicle-msgs diagnostic-updater geographic-msgs nav-msgs rclcpp rclcpp-components shape-msgs std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-flask" ]; };
  checkInputs = [ ament-lint-auto autoware-lint-common launch-testing launch-testing-ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_default_adapi" = substituteSource {
      src = fetchgit {
        name = "autoware_default_adapi-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "07d57f44e8bf6bb37e6d470b05660869304c3bae";
        hash = "sha256-ldKl/U9oRoa/YZKb3HY9E2SdoN0BapkHP0ybJQo/fFo=";
      };
    };
  });
  meta = {
    description = "The autoware_default_adapi package";
  };
})
