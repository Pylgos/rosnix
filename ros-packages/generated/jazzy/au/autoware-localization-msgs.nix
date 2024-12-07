{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
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
  pname = "autoware_localization_msgs";
  version = "1.3.0-1";
  src = finalAttrs.passthru.sources."autoware_localization_msgs";
  nativeBuildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_localization_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_localization_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "fd75827d8d0042839cc43d96dd193613de55b289";
        hash = "sha256-HLo1uh/g4wd99ftLqi3/6zJlXPXmfHtsfb7uDV2QbzE=";
      };
    };
  });
  meta = {
    description = "Autoware localization messages package.";
  };
})
