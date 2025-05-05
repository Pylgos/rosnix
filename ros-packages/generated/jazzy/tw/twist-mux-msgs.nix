{
  action-msgs,
  ament-cmake,
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
  pname = "twist_mux_msgs";
  version = "3.0.1-3";
  src = finalAttrs.passthru.sources."twist_mux_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ action-msgs rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "twist_mux_msgs" = substituteSource {
      src = fetchgit {
        name = "twist_mux_msgs-source";
        url = "https://github.com/ros2-gbp/twist_mux_msgs-release.git";
        rev = "ecd98d548cafd24f83f52d468fd27e7414787f05";
        hash = "sha256-ILOj3MizVk8mZox4k3XDTrx1z7e20vK78J+4k6OuLx8=";
      };
    };
  });
  meta = {
    description = "The twist_mux msgs and actions package";
  };
})
