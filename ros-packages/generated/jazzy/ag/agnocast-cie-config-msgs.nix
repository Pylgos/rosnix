{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "agnocast_cie_config_msgs";
  version = "2.3.3-1";
  src = finalAttrs.passthru.sources."agnocast_cie_config_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "agnocast_cie_config_msgs" = substituteSource {
      src = fetchgit {
        name = "agnocast_cie_config_msgs-source";
        url = "https://github.com/ros2-gbp/agnocast-release.git";
        rev = "d5719d2108b69316096b586734f3c00d37905505";
        hash = "sha256-0ZKX83ZhydZieq8JoyaKV6jsk/DA3MYl+rW+nTEVihM=";
      };
    };
  });
  meta = {
    description = "ROS messages for interaction between cie_thread_configurator and callback_isolated_executor.";
  };
})
