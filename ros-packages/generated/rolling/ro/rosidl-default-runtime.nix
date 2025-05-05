{
  action-msgs,
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-core-runtime,
  service-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_default_runtime";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."rosidl_default_runtime";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ action-msgs rosidl-core-runtime service-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ action-msgs rosidl-core-runtime service-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_default_runtime" = substituteSource {
      src = fetchgit {
        name = "rosidl_default_runtime-source";
        url = "https://github.com/ros2-gbp/rosidl_defaults-release.git";
        rev = "93e96a791b91981979ca2c23b5a99b0c87644aef";
        hash = "sha256-cFSE6ves5YkGqVsjGucMSY3oJRl3HFMuBgK7Y4xbzNQ=";
      };
    };
  });
  meta = {
    description = "A configuration package defining the runtime for the ROS interfaces.";
  };
})
