{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  autoware-common-msgs,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_internal_localization_msgs";
  version = "1.12.0-1";
  src = finalAttrs.passthru.sources."autoware_internal_localization_msgs";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ autoware-common-msgs geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ autoware-common-msgs geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_internal_localization_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_internal_localization_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_internal_msgs-release.git";
        rev = "46fc1bc94501f6fc78f605c3d53366332a8da9d1";
        hash = "sha256-FuqMACxHSWTEA5HlGVdhR1XWO1AtaH5lJoMogxfKGVI=";
      };
    };
  });
  meta = {
    description = "The autoware_internal_localization_msgs package";
  };
})
