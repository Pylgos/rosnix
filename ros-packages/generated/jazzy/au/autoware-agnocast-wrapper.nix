{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  autoware-utils-rclcpp,
  buildAmentCmakePackage,
  class-loader,
  fetchgit,
  fetchurl,
  fetchzip,
  message-filters,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_agnocast_wrapper";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_agnocast_wrapper";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-utils-rclcpp class-loader message-filters rclcpp rclcpp-components ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-utils-rclcpp class-loader message-filters rclcpp rclcpp-components ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_agnocast_wrapper" = substituteSource {
      src = fetchgit {
        name = "autoware_agnocast_wrapper-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "d184a4b0013eb069ff0c507b9a004bec8b2fe9a8";
        hash = "sha256-hF08mO3zvPsgVW6GjfrR2Vk0S8HtWjxLK/TjcQEIwHM=";
      };
    };
  });
  meta = {
    description = "Wrapper macros for Agnocast (true zero-copy communication library)";
  };
})
