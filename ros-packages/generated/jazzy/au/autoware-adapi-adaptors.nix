{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-adapi-specs,
  autoware-adapi-v1-msgs,
  autoware-cmake,
  autoware-component-interface-specs,
  autoware-lint-common,
  autoware-map-height-fitter,
  autoware-qos-utils,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_adapi_adaptors";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_adapi_adaptors";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-adapi-specs autoware-adapi-v1-msgs autoware-component-interface-specs autoware-map-height-fitter autoware-qos-utils rclcpp rclcpp-components ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-adapi-specs autoware-adapi-v1-msgs autoware-component-interface-specs autoware-map-height-fitter autoware-qos-utils rclcpp rclcpp-components ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_adapi_adaptors" = substituteSource {
      src = fetchgit {
        name = "autoware_adapi_adaptors-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "f068c637f7a701eb6a6e8a710310da7bd90d442a";
        hash = "sha256-CMbyt3zH7dke1BQYw9WS8wvO6Im62Ba4nQh4DxvWhlk=";
      };
    };
  });
  meta = {
    description = "The adapi_adaptors package";
  };
})
