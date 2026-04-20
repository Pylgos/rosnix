{
  agnocast-cie-config-msgs,
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "agnocast_cie_thread_configurator";
  version = "2.3.3-1";
  src = finalAttrs.passthru.sources."agnocast_cie_thread_configurator";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ agnocast-cie-config-msgs rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "yaml-cpp" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ agnocast-cie-config-msgs rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "yaml-cpp" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "agnocast_cie_thread_configurator" = substituteSource {
      src = fetchgit {
        name = "agnocast_cie_thread_configurator-source";
        url = "https://github.com/ros2-gbp/agnocast-release.git";
        rev = "f84ad0f8e1e8a3e41cee82a1838067e1a379ed1e";
        hash = "sha256-h403z2ZSU4RrQYomI3yuH4j2pZd4uhYb8rr9dOjhxB0=";
      };
    };
  });
  meta = {
    description = "A dedicated node that configures the scheduling attributes of each thread in callback_isolated_executor.";
  };
})
